################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CSP/src/drivers/can/can_socketcan.c 

OBJS += \
./CSP/src/drivers/can/can_socketcan.o 

C_DEPS += \
./CSP/src/drivers/can/can_socketcan.d 


# Each subdirectory must supply rules for building sources it contributes
CSP/src/drivers/can/%.o CSP/src/drivers/can/%.su CSP/src/drivers/can/%.cyclo: ../CSP/src/drivers/can/%.c CSP/src/drivers/can/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/TASK_Y4/F405_CAN/Tests" -I"D:/TASK_Y4/F405_CAN/CSP" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver/include" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver/src" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface/include" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface/src" -I"D:/TASK_Y4/F405_CAN/CSP/include" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/arch" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/crypto" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/drivers" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/freertos" -I"D:/TASK_Y4/F405_CAN/CSP/src/drivers/can" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CSP-2f-src-2f-drivers-2f-can

clean-CSP-2f-src-2f-drivers-2f-can:
	-$(RM) ./CSP/src/drivers/can/can_socketcan.cyclo ./CSP/src/drivers/can/can_socketcan.d ./CSP/src/drivers/can/can_socketcan.o ./CSP/src/drivers/can/can_socketcan.su

.PHONY: clean-CSP-2f-src-2f-drivers-2f-can

