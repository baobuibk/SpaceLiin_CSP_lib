/*
 * can_stm32.c
 *
 *  Created on: Sep 19, 2025
 *      Author: hoang
 */

#include "can_stm32.h"
#include "stm32f4xx_hal.h"
#include "csp_error.h"
#include "FreeRTOS.h"
#include "task.h"
#include "csp_types.h"


#define CSP_BASE_TYPE BaseType_t

extern CAN_HandleTypeDef hcan1;
// extern csp_can_interface_data_t can_interface_data_func;
extern csp_iface_t csp_if_can;


int csp_can_tx_frame(void *driver_data, uint32_t id, const uint8_t *data, uint8_t dlc)
{
//	if (dlc > 8) {
//		return CSP_ERR_INVAL;
//	}

	CAN_TxHeaderTypeDef txHeader;
	txHeader.DLC = dlc;
	txHeader.IDE = CAN_ID_STD;
	txHeader.RTR = CAN_RTR_DATA;
	txHeader.StdId = 0x103;
	txHeader.TransmitGlobalTime = DISABLE;


	uint32_t canMailBox;
//	HAL_CAN_AddTxMessage((CAN_HandleTypeDef *)driver_data, &txHeader, data, &canMailBox);
	HAL_CAN_AddTxMessage((CAN_HandleTypeDef *)driver_data, &txHeader, data, &canMailBox); // Còn phải sửa
	// uart_ring_buffer_put(data, dlc);
	return CSP_ERR_NONE;
}


void HAL_CAN_RxFifo0MsgPendingCallback(CAN_HandleTypeDef *hcan)
{
	uart_ring_buffer_put((uint8_t*)"CAN RX interrupt\n", 16);
	CAN_RxHeaderTypeDef RxHeader;
	CSP_BASE_TYPE xCspTaskWoken = pdFALSE;
	uint8_t RxData[8] = {0};
   if (HAL_CAN_GetRxMessage(hcan, CAN_RX_FIFO0, &RxHeader, RxData) == HAL_OK)
   {
       // Ở đây bạn xử lý dữ liệu nhận được
		csp_can_rx(&csp_if_can, RxHeader.StdId, RxData, RxHeader.DLC, &xCspTaskWoken);

       if(xCspTaskWoken) {
       		portYIELD_FROM_ISR(xCspTaskWoken);
       	}
   }
}
