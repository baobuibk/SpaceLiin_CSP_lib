/*
 * test_csp.c
 *
 *  Created on: Sep 14, 2025
 *      Author: hoang
 */

#include "test_csp.h"
#include <cmsis_os2.h>
#include "stm32f4xx_hal.h"
#include "stm32f4xx_hal_can.h"

#include "csp.h"
#include "csp_conn.h"
#include "csp_promisc.h"
#include <stdio.h>
#include "csp_rtable.h"
#include "csp_if_can.h"

#include "can_stm32.h"

volatile uint8_t string_debug[80];

TaskHandle_t hCspSend;
TaskHandle_t hCspReceive;
TaskHandle_t hCspRouter;

CAN_FilterTypeDef canfil;
extern CAN_HandleTypeDef hcan1;

extern csp_socket_t sock;

/**
   Get default CSP configuration.
*/
static uint8_t server_address = 3;
static unsigned int server_received = 0;

csp_can_interface_data_t can_interface_data_func =
{
		.cfp_packet_counter = 1,
		.tx_func = csp_can_tx_frame,
};

/* Add interface(s) */
volatile csp_iface_t csp_if_can = {0};

void CSP_Init(void)
{

  /* Initialising CSP */
uart_ring_buffer_put("Initialising CSP 2.0\r\n", 22);



csp_if_can.name = CSP_IF_CAN_DEFAULT_NAME;
csp_if_can.driver_data = &hcan1;
csp_if_can.netmask = (uint16_t)csp_id_get_host_bits(); //thiết lập netmask, giống với subnet mask của IP
//csp_if_can.nexthop = csp_can2_tx,
csp_if_can.interface_data = &can_interface_data_func;
csp_if_can.mtu = 64; ///?????????????????

  csp_init();

  csp_can_add_interface(&csp_if_can);

  csp_iface_t *can_iface = &csp_if_can;
//  csp_iflist_add(can_iface); //  Thêm interface (giao diện CAN) vào danh sách các giao diện của hệ thống CSP
//  error = csp_can_stm32_open_and_add_interface(csp_if_can.name, &can_iface, 0);
//  if (error != CSP_ERR_NONE)
//  {
//	  csp_log_error("csp_can_stm32_open_and_add_interface() failed, error: %d", error);
//  }
  /* Setting route table */

	  csp_rtable_set(0, 0, can_iface, CSP_NO_VIA_ADDRESS);

  /* Start router task with 1000 bytes of stack (priority is only supported on FreeRTOS) */
//  if(csp_route_start_task(1000, 1) != CSP_ERR_NONE)
//  {
//	  csp_log_warn("Failed to start router!");
//  }
	  xTaskCreate(vTaskCspRouter, "CSP_Router", 128 * 4, NULL, osPriorityNormal, &hCspRouter);
}

void vTaskCspRouter(void *pvParameters)
{
	uart_ring_buffer_put("Router: Router task started\r\n", 29);
	while (1)
	{
		csp_route_work();
		vTaskDelay(10);
	}
}


void vTaskCspSend(void *pvParameters)
{

	uart_ring_buffer_put("Client: Client task started\r\n", 33);
	vTaskDelay(10);

	// unsigned int count = 'A';

	for(;;) 
    {
		uart_ring_buffer_put((uint8_t*)"Client: csp_transaction start\r\n", 33);
        // uint8_t tx_data[4] = {1, 2, 3, 4};
        uint8_t tx_data[] = "AB\n";
        uint8_t rx_data[16];
        int len = csp_transaction(CSP_PRIO_NORM,  // Priority
        						  server_address, // Địa chỉ đích (dst addr)
								  MY_SERVER_PORT, // Dport cố định (ví dụ 10)
								  20,   		  // Sport cố định (ví dụ 20)
								  tx_data, strlen((char*)tx_data) , rx_data, -1);
        if (len > 0) 
        {
            sprintf((char *)string_debug, "Client: Received %d bytes!\n", len);
            uart_ring_buffer_put(string_debug, strlen((char *)string_debug));
        }
		uart_ring_buffer_put((uint8_t*)"Client: csp_transaction end\r\n", 31);
		vTaskDelay(500);
	}

}



void vTaskCspReceive(void *pvParameters)
{

	sprintf(string_debug, "server task started\n");
	uart_ring_buffer_put(string_debug, strlen((char *)string_debug));

	/* Wait for connections and then process packets on the connection */
	for(;;) 
	{
	    csp_conn_t * conn;
	    sock.opts = CSP_SO_CONN_LESS;
	    csp_packet_t * packet;

	    // Nhận trực tiếp từ socket, không cần accept
	    if ((packet = csp_recvfrom(&sock, 1000)) != NULL) {
	        sprintf(string_debug, "Server: Packet received on port %u: %s\n",
	                packet->id.dport, (char*) packet->data);
	        uart_ring_buffer_put(string_debug, strlen((char *)string_debug));

	        csp_buffer_free(packet);
	    }

	}
}



