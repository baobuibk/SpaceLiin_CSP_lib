################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CSP/src/interfaces/csp_if_can.c \
../CSP/src/interfaces/csp_if_can_pbuf.c \
../CSP/src/interfaces/csp_if_lo.c 

OBJS += \
./CSP/src/interfaces/csp_if_can.o \
./CSP/src/interfaces/csp_if_can_pbuf.o \
./CSP/src/interfaces/csp_if_lo.o 

C_DEPS += \
./CSP/src/interfaces/csp_if_can.d \
./CSP/src/interfaces/csp_if_can_pbuf.d \
./CSP/src/interfaces/csp_if_lo.d 


# Each subdirectory must supply rules for building sources it contributes
CSP/src/interfaces/%.o CSP/src/interfaces/%.su CSP/src/interfaces/%.cyclo: ../CSP/src/interfaces/%.c CSP/src/interfaces/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -DUSE_FULL_LL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/TASK_Y4/F405_CAN/Tests" -I"D:/TASK_Y4/F405_CAN/CSP" -I"D:/TASK_Y4/F405_CAN/CSP/include" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/arch" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/crypto" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/drivers" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/freertos" -I"D:/TASK_Y4/F405_CAN/CSP/src/drivers/can" -I"D:/TASK_Y4/F405_CAN/CSP/src/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/posix" -I"D:/TASK_Y4/F405_CAN/Services/Logger" -I"D:/TASK_Y4/F405_CAN/CSP/can_stm32" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CSP-2f-src-2f-interfaces

clean-CSP-2f-src-2f-interfaces:
	-$(RM) ./CSP/src/interfaces/csp_if_can.cyclo ./CSP/src/interfaces/csp_if_can.d ./CSP/src/interfaces/csp_if_can.o ./CSP/src/interfaces/csp_if_can.su ./CSP/src/interfaces/csp_if_can_pbuf.cyclo ./CSP/src/interfaces/csp_if_can_pbuf.d ./CSP/src/interfaces/csp_if_can_pbuf.o ./CSP/src/interfaces/csp_if_can_pbuf.su ./CSP/src/interfaces/csp_if_lo.cyclo ./CSP/src/interfaces/csp_if_lo.d ./CSP/src/interfaces/csp_if_lo.o ./CSP/src/interfaces/csp_if_lo.su

.PHONY: clean-CSP-2f-src-2f-interfaces

