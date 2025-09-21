################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CSP/src/arch/freertos/csp_clock.c \
../CSP/src/arch/freertos/csp_queue.c \
../CSP/src/arch/freertos/csp_semaphore.c \
../CSP/src/arch/freertos/csp_system.c \
../CSP/src/arch/freertos/csp_time.c 

OBJS += \
./CSP/src/arch/freertos/csp_clock.o \
./CSP/src/arch/freertos/csp_queue.o \
./CSP/src/arch/freertos/csp_semaphore.o \
./CSP/src/arch/freertos/csp_system.o \
./CSP/src/arch/freertos/csp_time.o 

C_DEPS += \
./CSP/src/arch/freertos/csp_clock.d \
./CSP/src/arch/freertos/csp_queue.d \
./CSP/src/arch/freertos/csp_semaphore.d \
./CSP/src/arch/freertos/csp_system.d \
./CSP/src/arch/freertos/csp_time.d 


# Each subdirectory must supply rules for building sources it contributes
CSP/src/arch/freertos/%.o CSP/src/arch/freertos/%.su CSP/src/arch/freertos/%.cyclo: ../CSP/src/arch/freertos/%.c CSP/src/arch/freertos/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -DUSE_FULL_LL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/TASK_Y4/F405_CAN/Tests" -I"D:/TASK_Y4/F405_CAN/CSP" -I"D:/TASK_Y4/F405_CAN/CSP/include" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/arch" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/crypto" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/drivers" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/freertos" -I"D:/TASK_Y4/F405_CAN/CSP/src/drivers/can" -I"D:/TASK_Y4/F405_CAN/CSP/src/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/posix" -I"D:/TASK_Y4/F405_CAN/Services/Logger" -I"D:/TASK_Y4/F405_CAN/CSP/can_stm32" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CSP-2f-src-2f-arch-2f-freertos

clean-CSP-2f-src-2f-arch-2f-freertos:
	-$(RM) ./CSP/src/arch/freertos/csp_clock.cyclo ./CSP/src/arch/freertos/csp_clock.d ./CSP/src/arch/freertos/csp_clock.o ./CSP/src/arch/freertos/csp_clock.su ./CSP/src/arch/freertos/csp_queue.cyclo ./CSP/src/arch/freertos/csp_queue.d ./CSP/src/arch/freertos/csp_queue.o ./CSP/src/arch/freertos/csp_queue.su ./CSP/src/arch/freertos/csp_semaphore.cyclo ./CSP/src/arch/freertos/csp_semaphore.d ./CSP/src/arch/freertos/csp_semaphore.o ./CSP/src/arch/freertos/csp_semaphore.su ./CSP/src/arch/freertos/csp_system.cyclo ./CSP/src/arch/freertos/csp_system.d ./CSP/src/arch/freertos/csp_system.o ./CSP/src/arch/freertos/csp_system.su ./CSP/src/arch/freertos/csp_time.cyclo ./CSP/src/arch/freertos/csp_time.d ./CSP/src/arch/freertos/csp_time.o ./CSP/src/arch/freertos/csp_time.su

.PHONY: clean-CSP-2f-src-2f-arch-2f-freertos

