/*
 * can_stm32.h
 *
 *  Created on: Sep 19, 2025
 *      Author: hoang
 */

#ifndef CAN_STM32_CAN_STM32_H_
#define CAN_STM32_CAN_STM32_H_

#include "stdint.h"

int csp_can_tx_frame(void *driver_data, uint32_t id, const uint8_t *data, uint8_t dlc);

#endif /* CAN_STM32_CAN_STM32_H_ */
