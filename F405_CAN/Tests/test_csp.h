/*
 * test_csp.h
 *
 *  Created on: Sep 14, 2025
 *      Author: hoang
 */

#ifndef TEST_CSP_H_
#define TEST_CSP_H_

#include "FreeRTOS.h"
#include "task.h"

#define MY_SERVER_PORT		10
#define SERVER_ADDRESS      255

extern TaskHandle_t hCspSend;
extern TaskHandle_t hCspReceive;

void CSP_Init(void);
void vTaskCspSend(void *pvParameters);
void vTaskCspReceive(void *pvParameters);
void vTaskCspRouter(void *pvParameters);

#endif /* TEST_CSP_H_ */
