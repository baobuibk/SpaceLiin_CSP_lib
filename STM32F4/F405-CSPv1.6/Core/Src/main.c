/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "cmsis_os.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
#include <string.h>
#include "stream_buffer.h"

#include <csp/csp.h>
#include <csp/interfaces/csp_if_can.h>
//#include <csp/interfaces/csp_if_i2c.h>
#include <csp/interfaces/csp_if_kiss.h>
#include <csp/csp_rtable.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
extern csp_conf_t csp_conf;
csp_can_interface_data_t can_ifdata;
csp_iface_t can_iface;

//csp_i2c_interface_data_t i2c_ifdata;
//csp_iface_t i2c_iface;

csp_kiss_interface_data_t uart_ifdata;
csp_iface_t uart_iface;
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define UART_RX_STREAM_SIZE 256
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
CAN_HandleTypeDef hcan1;

/* Definitions for defaultTask */
osThreadId_t defaultTaskHandle;
const osThreadAttr_t defaultTask_attributes = {
  .name = "defaultTask",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityNormal,
};
/* Definitions for canReceive */
osThreadId_t canReceiveHandle;
const osThreadAttr_t canReceive_attributes = {
  .name = "canReceive",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityAboveNormal,
};
/* Definitions for canSend */
osThreadId_t canSendHandle;
const osThreadAttr_t canSend_attributes = {
  .name = "canSend",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityLow,
};
/* USER CODE BEGIN PV */
uint32_t server_received = 0;

//static uint8_t  rx_byte;
//static StreamBufferHandle_t xUartRxStream;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_CAN1_Init(void);
static void MX_USART6_UART_Init(void);
void StartDefaultTask(void *argument);
void CANReceive(void *argument);
void CANSend(void *argument);

/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
/*TX FUNCTION*/
static int csp_can_tx_frame(void *driver_data, uint32_t id, const uint8_t *data, uint8_t dlc){

	HAL_GPIO_TogglePin(GPIOC, GPIO_PIN_5);

	CAN_TxHeaderTypeDef txHeader;
	txHeader.DLC = dlc;
	txHeader.IDE = CAN_ID_EXT;
	txHeader.RTR = CAN_RTR_DATA;
	txHeader.ExtId = id;
	txHeader.TransmitGlobalTime = DISABLE;

	uint32_t canMailBox;
	if (HAL_CAN_AddTxMessage(&hcan1, &txHeader, (uint8_t *)data, &canMailBox) != HAL_OK) {
	        return CSP_ERR_DRIVER;
	    }
	return CSP_ERR_NONE;
}

//static int csp_i2c_tx_frame(){
//	return CSP_ERR_NONE;
//}


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

/*CALLBACK*/
void HAL_CAN_RxFifo0MsgPendingCallback(CAN_HandleTypeDef *hcan) {
	CAN_RxHeaderTypeDef rxHeader;
	uint8_t rxData[8];

	CSP_BASE_TYPE xCspTaskWoken = pdFALSE;
	 if (HAL_CAN_GetRxMessage(hcan, CAN_RX_FIFO0, &rxHeader, rxData) == HAL_OK) {
		 csp_can_rx(&can_iface, rxHeader.ExtId, rxData, rxHeader.DLC, &xCspTaskWoken);
		 HAL_GPIO_TogglePin(GPIOC, GPIO_PIN_5);

	    	if(xCspTaskWoken) {
	    		portYIELD_FROM_ISR(xCspTaskWoken);
	    	}
	 }
}

//void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart) {
////	HAL_GPIO_TogglePin(GPIOC, GPIO_PIN_5);
//    if (huart == &huart6) {
//        BaseType_t xHigher = pdFALSE;
//        xStreamBufferSendFromISR(xUartRxStream, &rx_byte, 1, &xHigher);
//
//        HAL_UART_Transmit(&huart6, &rx_byte, 1, 100);
//        HAL_UART_Receive_IT(&huart6, &rx_byte, 1);
//
//        portYIELD_FROM_ISR(xHigher);
//    }
//}


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

/*INTERFACE INIT*/
static void can_csp_init(void) {

	can_ifdata.tx_func        = csp_can_tx_frame;
	can_iface.name            = "can";
	can_iface.driver_data     = &hcan1;
	can_iface.interface_data  = &can_ifdata;

	csp_can_add_interface(&can_iface);
 }

static void uart_csp_init(void) {

	uart_ifdata.tx_func        = csp_uart_tx_frame;
	uart_iface.name            = "uart";
	uart_iface.driver_data     = USART6;
	uart_iface.interface_data  = &uart_ifdata;

	csp_kiss_add_interface(&uart_iface);
 }

//static void i2c_csp_init(void) {
//
//	i2c_ifdata.tx_func        = csp_i2c_tx_frame;
//	i2c_iface.name            = "i2c";
//	i2c_iface.driver_data     = &hi2c1;
//	i2c_iface.interface_data  = &i2c_ifdata;
//
//	csp_i2c_add_interface(&i2c_iface);
//}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_CAN1_Init();
  MX_USART6_UART_Init();
  /* USER CODE BEGIN 2 */

  /*UART INIT*/
  // Ví dụ UART6
  LL_USART_EnableIT_RXNE(USART6);  // Bật ngắt khi RX buffer có dữ liệu
  LL_USART_Enable(USART6);          // Bật UART
//  uart_debug_init();

  /*CAN INIT*/
  HAL_CAN_Start(&hcan1);
  HAL_CAN_ActivateNotification(&hcan1, CAN_IT_RX_FIFO0_MSG_PENDING);

  /*UART INIT*/
//  xUartRxStream = xStreamBufferCreate(UART_RX_STREAM_SIZE, 1);
//  HAL_UART_Receive_IT(&huart6, &rx_byte, 1);

  /*CSP INIT*/
  csp_conf_get_defaults(&csp_conf);
  csp_conf.address = 1;
  csp_init(&csp_conf);

  /*CSP INTERFACE INIT*/
  can_csp_init();
  uart_csp_init();
//  i2c_csp_init();

  /*CSP ROUTER INIT*/
  csp_route_start_task(500, 6);
//  csp_rtable_set(1, CSP_ID_HOST_SIZE, &can_iface, CSP_NO_VIA_ADDRESS);
  csp_rtable_set(1, CSP_ID_HOST_SIZE, &uart_iface, CSP_NO_VIA_ADDRESS);

  /* USER CODE END 2 */

  /* Init scheduler */
  osKernelInitialize();

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */
  /* USER CODE END RTOS_QUEUES */

  /* Create the thread(s) */
  /* creation of defaultTask */
  defaultTaskHandle = osThreadNew(StartDefaultTask, NULL, &defaultTask_attributes);

  /* creation of canReceive */
  canReceiveHandle = osThreadNew(CANReceive, NULL, &canReceive_attributes);

  /* creation of canSend */
//  canSendHandle = osThreadNew(CANSend, NULL, &canSend_attributes);

  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
  /* USER CODE END RTOS_THREADS */

  /* USER CODE BEGIN RTOS_EVENTS */
  /* add events, ... */
  /* USER CODE END RTOS_EVENTS */

  /* Start scheduler */
  osKernelStart();

  /* We should never get here as control is now taken by the scheduler */
  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 72;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief CAN1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_CAN1_Init(void)
{

  /* USER CODE BEGIN CAN1_Init 0 */

  /* USER CODE END CAN1_Init 0 */

  /* USER CODE BEGIN CAN1_Init 1 */

  /* USER CODE END CAN1_Init 1 */
  hcan1.Instance = CAN1;
  hcan1.Init.Prescaler = 18;
  hcan1.Init.Mode = CAN_MODE_NORMAL;
  hcan1.Init.SyncJumpWidth = CAN_SJW_1TQ;
  hcan1.Init.TimeSeg1 = CAN_BS1_2TQ;
  hcan1.Init.TimeSeg2 = CAN_BS2_1TQ;
  hcan1.Init.TimeTriggeredMode = DISABLE;
  hcan1.Init.AutoBusOff = DISABLE;
  hcan1.Init.AutoWakeUp = DISABLE;
  hcan1.Init.AutoRetransmission = DISABLE;
  hcan1.Init.ReceiveFifoLocked = DISABLE;
  hcan1.Init.TransmitFifoPriority = DISABLE;
  if (HAL_CAN_Init(&hcan1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN CAN1_Init 2 */
  CAN_FilterTypeDef filterconf = {0};
  filterconf.FilterBank = 0;
  filterconf.FilterMode = CAN_FILTERMODE_IDMASK;
  filterconf.FilterScale = CAN_FILTERSCALE_32BIT;
  filterconf.FilterIdHigh = 0;
  filterconf.FilterIdLow = 0;
  filterconf.FilterMaskIdHigh = 0;
  filterconf.FilterMaskIdLow = 0;
  filterconf.FilterFIFOAssignment = CAN_RX_FIFO0;
  filterconf.FilterActivation = ENABLE;
  filterconf.SlaveStartFilterBank = 14;
  HAL_CAN_ConfigFilter(&hcan1, &filterconf);
  /* USER CODE END CAN1_Init 2 */

}

/**
  * @brief USART6 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART6_UART_Init(void)
{

  /* USER CODE BEGIN USART6_Init 0 */

  /* USER CODE END USART6_Init 0 */

  LL_USART_InitTypeDef USART_InitStruct = {0};

  LL_GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* Peripheral clock enable */
  LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_USART6);

  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
  /**USART6 GPIO Configuration
  PC6   ------> USART6_TX
  PC7   ------> USART6_RX
  */
  GPIO_InitStruct.Pin = LL_GPIO_PIN_6|LL_GPIO_PIN_7;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_ALTERNATE;
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_PUSHPULL;
  GPIO_InitStruct.Pull = LL_GPIO_PULL_NO;
  GPIO_InitStruct.Alternate = LL_GPIO_AF_8;
  LL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /* USART6 interrupt Init */
  NVIC_SetPriority(USART6_IRQn, NVIC_EncodePriority(NVIC_GetPriorityGrouping(),5, 0));
  NVIC_EnableIRQ(USART6_IRQn);

  /* USER CODE BEGIN USART6_Init 1 */

  /* USER CODE END USART6_Init 1 */
  USART_InitStruct.BaudRate = 115200;
  USART_InitStruct.DataWidth = LL_USART_DATAWIDTH_8B;
  USART_InitStruct.StopBits = LL_USART_STOPBITS_1;
  USART_InitStruct.Parity = LL_USART_PARITY_NONE;
  USART_InitStruct.TransferDirection = LL_USART_DIRECTION_TX_RX;
  USART_InitStruct.HardwareFlowControl = LL_USART_HWCONTROL_NONE;
  USART_InitStruct.OverSampling = LL_USART_OVERSAMPLING_16;
  LL_USART_Init(USART6, &USART_InitStruct);
  LL_USART_ConfigAsyncMode(USART6);
  LL_USART_Enable(USART6);
  /* USER CODE BEGIN USART6_Init 2 */

  /* USER CODE END USART6_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
/* USER CODE BEGIN MX_GPIO_Init_1 */
/* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOC, GPIO_PIN_5, GPIO_PIN_RESET);

  /*Configure GPIO pin : PC5 */
  GPIO_InitStruct.Pin = GPIO_PIN_5;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /*Configure GPIO pins : PB6 PB7 */
  GPIO_InitStruct.Pin = GPIO_PIN_6|GPIO_PIN_7;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_OD;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Alternate = GPIO_AF4_I2C1;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */
/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/* USER CODE BEGIN Header_StartDefaultTask */
/**
  * @brief  Function implementing the defaultTask thread.
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_StartDefaultTask */
void StartDefaultTask(void *argument)
{
  /* USER CODE BEGIN 5 */
  /* Infinite loop */
  for(;;)
  {
	  osDelay(100);
  }
  /* USER CODE END 5 */
}

/* USER CODE BEGIN Header_CANReceive */
/**
* @brief Function implementing the canReceive thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_CANReceive */
void CANReceive(void *argument)
{
  /* USER CODE BEGIN CANReceive */
	/* Create socket with no specific socket options, e.g. accepts CRC32, HMAC, XTEA, etc. if enabled during compilation */
	csp_socket_t *sock = csp_socket(CSP_SO_NONE);

	/* Bind socket to all ports, e.g. all incoming connections will be handled here */
	csp_bind(sock, CSP_ANY);

	/* Create a backlog of 10 connections, i.e. up to 10 new connections can be queued */
	csp_listen(sock, 10);
  /* Infinite loop */
  for(;;)
  {
	  /* Wait for a new connection, 10000 mS timeout */
	  	csp_conn_t *conn;
	  	if ((conn = csp_accept(sock, 10000)) == NULL) {
	  		/* timeout */
	  		continue;
	  	}

	  	/* Read packets on connection, timout is 100 mS */
	  	csp_packet_t *packet;
	  	while ((packet = csp_read(conn, 100)) != NULL) {
	  		switch (csp_conn_dport(conn)) {
	  		case 0:
	  		case 1:
	  		case 26:
	  		case 3:
	  		case 48:
	  		case 8:
	  		case 10:
	  			/* Process packet here */
	  			csp_log_info("Packet received on MY_SERVER_PORT: %s", (char *) packet->data);
	  			csp_buffer_free(packet);
	  			++server_received;
	  			break;

	  		default:
	  			/* Call the default CSP service handler, handle pings, buffer use, etc. */
	  	//				csp_service_handler(conn, packet);
	  			break;
	  		}
	  	}
  }
  /* USER CODE END CANReceive */
}

/* USER CODE BEGIN Header_CANSend */
/**
* @brief Function implementing the canSend thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_CANSend */
void CANSend(void *argument)
{
  /* USER CODE BEGIN CANSend */
	const uint8_t DST  = 1;   // Receiver Addr
	const uint8_t PORT = 10;
	const char *msg = "Hello from F405";
  /* Infinite loop */
  for(;;)
  {
	csp_conn_t *conn = csp_connect(CSP_PRIO_NORM, DST, PORT, 1000 /*ms*/, CSP_O_NONE);
	if (conn == NULL) {
	  osDelay(1000);
	  continue;
	}

	/* Cấp packet và copy payload */
	size_t len = strlen(msg);
	csp_packet_t *pkt = csp_buffer_get(len);
	if (pkt == NULL) {
	  csp_close(conn);
	  osDelay(1000);
	  continue;
	}

	memcpy(pkt->data, msg, len);
	pkt->length = len;

	/* Gửi packet, nếu lỗi thì phải free buffer */
	if (csp_send(conn, pkt, 1000 /*ms*/) != CSP_ERR_NONE) {
	  csp_buffer_free(pkt);
	}

	csp_close(conn);

	osDelay(1000);
  }
  /* USER CODE END CANSend */
}

/**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM1 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  /* USER CODE BEGIN Callback 0 */

  /* USER CODE END Callback 0 */
  if (htim->Instance == TIM1) {
    HAL_IncTick();
  }
  /* USER CODE BEGIN Callback 1 */

  /* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
