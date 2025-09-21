#include <debug_logger.h>

// Huownngs dẫn dùng: generrate IOC có ngắt + gọi hầm này uart_IRQ_handler tròn ngắt UART

// Global variables
ring_buffer_t uart_ring_buffer;
volatile uint8_t uart_tx_busy = 0;
volatile uint16_t current_tx_count = 0;

// static prototype
void uart_transmit_IT_start(void);
void uart_IRQ_handler(void);
void uart_ring_buffer_init(void);
uint8_t uart_ring_buffer_get(uint8_t* byte);
uint8_t uart_ring_buffer_is_empty(void);
uint16_t uart_ring_buffer_available(void);

/**
 * @brief Initialize ring buffer
 */
void uart_ring_buffer_init(void)
{
    uart_ring_buffer.head = 0;
    uart_ring_buffer.tail = 0;
    uart_ring_buffer.count = 0;
    uart_tx_busy = 0;
}

/**
 * @brief Put data into ring buffer - FAST & INTERRUPT SAFE
 * @param data: Pointer to data
 * @param length: Length of data
 * @return Number of bytes actually written
 */
uint8_t uart_ring_buffer_put(uint8_t* data, uint16_t length)
{
    uint16_t written = 0;

    // Disable interrupts briefly for atomic operation
    __disable_irq();

    for (uint16_t i = 0; i < length; i++)
    {
        // Check if buffer full
        if (uart_ring_buffer.count >= RING_BUFFER_SIZE)
        {
            break; // Buffer full, stop writing
        }

        // Put byte into buffer
        uart_ring_buffer.data[uart_ring_buffer.head] = data[i];
        uart_ring_buffer.head = (uart_ring_buffer.head + 1) % RING_BUFFER_SIZE;
        uart_ring_buffer.count++;
        written++;
    }

    __enable_irq();

    return written;
}

/**
 * @brief Get one byte from ring buffer
 * @param byte: Pointer to store the byte
 * @return 1 if success, 0 if buffer empty
 */
uint8_t uart_ring_buffer_get(uint8_t* byte)
{
    if (uart_ring_buffer_is_empty())
    {
        return 0;
    }

    *byte = uart_ring_buffer.data[uart_ring_buffer.tail];
    uart_ring_buffer.tail = (uart_ring_buffer.tail + 1) % RING_BUFFER_SIZE;
    uart_ring_buffer.count--;

    return 1;
}

/**
 * @brief Check if ring buffer is empty
 */
uint8_t uart_ring_buffer_is_empty(void)
{
    return (uart_ring_buffer.count == 0);
}

/**
 * @brief Get number of available bytes in buffer
 */
uint16_t uart_ring_buffer_available(void)
{
    return uart_ring_buffer.count;
}

/**
 * @brief Task for processing debug logging
 * Call this in main loop
 */
void task_debug_logging(void)
{
    // If UART not busy and buffer has data, start transmission
    if (!uart_tx_busy && !uart_ring_buffer_is_empty())
    {
        uart_transmit_IT_start();
    }
}

/**
 * @brief Start UART transmission
 */
void uart_transmit_IT_start(void)
{
    uint8_t first_byte;

    if (uart_ring_buffer_get(&first_byte))
    {
        uart_tx_busy = 1;
        current_tx_count = 1;

        // Enable TXE interrupt and send first byte
        LL_USART_TransmitData8(USART6, first_byte);
        LL_USART_EnableIT_TXE(USART6);

    }
}

/**
 * @brief UART interrupt handler
 * Call this in UART IRQ handler
 */
void uart_IRQ_handler(void)
{
    // TXE interrupt - ready to send next byte
    if (LL_USART_IsActiveFlag_TXE(USART6) && LL_USART_IsEnabledIT_TXE(USART6))
    {
        uint8_t next_byte;

        if (uart_ring_buffer_get(&next_byte))
        {
            // Send next byte
            LL_USART_TransmitData8(USART6, next_byte);
            current_tx_count++;
        }
        else
        {
            // No more data, wait for transmission complete
            LL_USART_DisableIT_TXE(USART6);
            LL_USART_EnableIT_TC(USART6);
        }
    }

    // TC interrupt - transmission complete
    if (LL_USART_IsActiveFlag_TC(USART6) && LL_USART_IsEnabledIT_TC(USART6))
    {
        LL_USART_ClearFlag_TC(USART6);
        LL_USART_DisableIT_TC(USART6);

        // Mark as not busy
        uart_tx_busy = 0;
        current_tx_count = 0;
    }
}

/**
 * @brief Initialize debug system
 */
void uart_debug_init(void)
{
    uart_ring_buffer_init();

    // Enable UART interrupt
    NVIC_SetPriority(USART6_IRQn, 0);
    NVIC_EnableIRQ(USART6_IRQn);
}


// Put this in stm32f7xx_it.c
/*
void USART2_IRQHandler(void) {
    uart_IRQ_handler();
}
*/

// Example usage:
/*
int main(void) {
    uart_debug_init();

    uint32_t counter = 0;

    while (1) {
        // Process UART transmission
        task_debug_logging();

        // Simple debug - just push string to buffer
        uint8_t msg[] = "Hello World\n";
        uart_ring_buffer_put(msg, 12);

        // Or with counter
        uint8_t buffer[50];
        // You format the string yourself however you want
        // Then just push it:
        uart_ring_buffer_put(buffer, length);

        counter++;

        // Delay
        for (volatile uint32_t i = 0; i < 1000000; i++);
    }
}
*/

// Usage in interrupt - SUPER FAST!
/*
void TIM2_IRQHandler(void) {
    if (LL_TIM_IsActiveFlag_UPDATE(TIM2)) {
        LL_TIM_ClearFlag_UPDATE(TIM2);

        // Just push pre-formatted string - VERY FAST!
        uart_ring_buffer_put("IRQ\n", 4);

        // Or push variable data if you have it formatted
        uint8_t msg[10];
        // ... format msg yourself ...
        uart_ring_buffer_put(msg, msg_length);
    }
}
*/
