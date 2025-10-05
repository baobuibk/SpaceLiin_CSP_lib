- Đưa thư viện CSP vào STM32 chạy trên FreeRTOS, xóa các thư mục file dùng trong linux/python. Thêm file csp_autoconfig.h

- Tạo init cho driver muốn sử dụng cho CSP.

```C
static void uart_csp_init(void) {

	uart_ifdata.tx_func        = csp_uart_tx_frame;
	uart_iface.name            = "uart";
	uart_iface.driver_data     = USART6;
	uart_iface.interface_data  = &uart_ifdata;

	csp_kiss_add_interface(&uart_iface);
 }
```

- `csp_uart_tx_frame` là hàm được người dùng tự định nghĩa thêm để dữ liệu từ libcsp đưa ra lớp vật lí lúc truyền đi. Hàm này sẽ được gọi trong `csp_kiss_tx`.

```C
void csp_uart_tx_frame(void *driver, const uint8_t *data, uint32_t len)
{

    for (uint32_t i = 0; i < len; i++)
    {
        // chờ khi TXE = 1 (thanh ghi truyền trống)
        while (!LL_USART_IsActiveFlag_TXE(USART6));
        LL_USART_TransmitData8(USART6, data[i]);  // cấn phải sửa biến truyền vào
    }

    // chờ truyền xong byte cuối
    while (!LL_USART_IsActiveFlag_TC(USART6));
}
```

- Hàm nhận để đưa thừ lớp vật lí lên lớp CSP:

```C
void CSP_UART_IRQHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;

    // Kiểm tra có dữ liệu mới nhận
    if(LL_USART_IsActiveFlag_RXNE(USART6))
    {
        uint8_t rx_byte = LL_USART_ReceiveData8(USART6);

        // Gửi dữ liệu vào stream buffer FreeRTOS từ ISR
        csp_kiss_rx(&uart_iface, &rx_byte, 1, &xHigherPriorityTaskWoken);
        // Echo lại byte nhận
//        LL_USART_TransmitData8(USART6, rx_byte);
    }

    portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}
```
`csp_kiss_rx` là hàm được libcsp định nghĩa.

- `csp_conf.address = 1;` dùng để gán địa chỉ cho node

- `csp_rtable_set(1, CSP_ID_HOST_SIZE, &uart_iface, CSP_NO_VIA_ADDRESS);` hàm này để set địa chỉ của node đích đến thông qua driver nào, thong qua node trung gian nào.