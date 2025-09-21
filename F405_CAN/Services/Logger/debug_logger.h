/*
 * Debug.h
 *
 *  Created on: Aug 12, 2025
 *      Author: hoang
 */

#ifndef INC_DEBUG_H_
#define INC_DEBUG_H_

#include "stm32f4xx_ll_usart.h"
#include <stdint.h>

// Ring buffer configuration
#define RING_BUFFER_SIZE 512  // Tổng kích thước buffer

// Ring buffer structure
typedef struct
{
    uint8_t data[RING_BUFFER_SIZE];
    volatile uint16_t head;
    volatile uint16_t tail;
    volatile uint16_t count;
} ring_buffer_t;

// Global variables
extern ring_buffer_t uart_ring_buffer;
extern volatile uint8_t uart_tx_busy;
extern volatile uint16_t current_tx_count;

// Function prototypes
void uart_debug_init(void);
void task_debug_logging(void);
uint8_t uart_ring_buffer_put(uint8_t* data, uint16_t length);
void uart_IRQ_handler(void);



#endif /* INC_DEBUG_H_ */
