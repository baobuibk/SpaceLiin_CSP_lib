################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CSP/CAN\ Driver/src/can_stm32.c \
../CSP/CAN\ Driver/src/can_stm32_backup_22-05-23.c \
../CSP/CAN\ Driver/src/csp_driver_can.c 

OBJS += \
./CSP/CAN\ Driver/src/can_stm32.o \
./CSP/CAN\ Driver/src/can_stm32_backup_22-05-23.o \
./CSP/CAN\ Driver/src/csp_driver_can.o 

C_DEPS += \
./CSP/CAN\ Driver/src/can_stm32.d \
./CSP/CAN\ Driver/src/can_stm32_backup_22-05-23.d \
./CSP/CAN\ Driver/src/csp_driver_can.d 


# Each subdirectory must supply rules for building sources it contributes
CSP/CAN\ Driver/src/can_stm32.o: ../CSP/CAN\ Driver/src/can_stm32.c CSP/CAN\ Driver/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/TASK_Y4/F405_CAN/Tests" -I"D:/TASK_Y4/F405_CAN/CSP" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver/include" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver/src" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface/include" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface/src" -I"D:/TASK_Y4/F405_CAN/CSP/include" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/arch" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/crypto" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/drivers" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/freertos" -I"D:/TASK_Y4/F405_CAN/CSP/src/drivers/can" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"CSP/CAN Driver/src/can_stm32.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
CSP/CAN\ Driver/src/can_stm32_backup_22-05-23.o: ../CSP/CAN\ Driver/src/can_stm32_backup_22-05-23.c CSP/CAN\ Driver/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/TASK_Y4/F405_CAN/Tests" -I"D:/TASK_Y4/F405_CAN/CSP" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver/include" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver/src" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface/include" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface/src" -I"D:/TASK_Y4/F405_CAN/CSP/include" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/arch" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/crypto" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/drivers" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/freertos" -I"D:/TASK_Y4/F405_CAN/CSP/src/drivers/can" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"CSP/CAN Driver/src/can_stm32_backup_22-05-23.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
CSP/CAN\ Driver/src/csp_driver_can.o: ../CSP/CAN\ Driver/src/csp_driver_can.c CSP/CAN\ Driver/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/TASK_Y4/F405_CAN/Tests" -I"D:/TASK_Y4/F405_CAN/CSP" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver/include" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver/src" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface/include" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface/src" -I"D:/TASK_Y4/F405_CAN/CSP/include" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/arch" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/crypto" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/drivers" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/freertos" -I"D:/TASK_Y4/F405_CAN/CSP/src/drivers/can" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"CSP/CAN Driver/src/csp_driver_can.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CSP-2f-CAN-20-Driver-2f-src

clean-CSP-2f-CAN-20-Driver-2f-src:
	-$(RM) ./CSP/CAN\ Driver/src/can_stm32.cyclo ./CSP/CAN\ Driver/src/can_stm32.d ./CSP/CAN\ Driver/src/can_stm32.o ./CSP/CAN\ Driver/src/can_stm32.su ./CSP/CAN\ Driver/src/can_stm32_backup_22-05-23.cyclo ./CSP/CAN\ Driver/src/can_stm32_backup_22-05-23.d ./CSP/CAN\ Driver/src/can_stm32_backup_22-05-23.o ./CSP/CAN\ Driver/src/can_stm32_backup_22-05-23.su ./CSP/CAN\ Driver/src/csp_driver_can.cyclo ./CSP/CAN\ Driver/src/csp_driver_can.d ./CSP/CAN\ Driver/src/csp_driver_can.o ./CSP/CAN\ Driver/src/csp_driver_can.su

.PHONY: clean-CSP-2f-CAN-20-Driver-2f-src

