################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CSP/src/arch/posix/csp_clock.c \
../CSP/src/arch/posix/csp_queue.c \
../CSP/src/arch/posix/csp_semaphore.c \
../CSP/src/arch/posix/csp_system.c \
../CSP/src/arch/posix/csp_time.c \
../CSP/src/arch/posix/pthread_queue.c 

OBJS += \
./CSP/src/arch/posix/csp_clock.o \
./CSP/src/arch/posix/csp_queue.o \
./CSP/src/arch/posix/csp_semaphore.o \
./CSP/src/arch/posix/csp_system.o \
./CSP/src/arch/posix/csp_time.o \
./CSP/src/arch/posix/pthread_queue.o 

C_DEPS += \
./CSP/src/arch/posix/csp_clock.d \
./CSP/src/arch/posix/csp_queue.d \
./CSP/src/arch/posix/csp_semaphore.d \
./CSP/src/arch/posix/csp_system.d \
./CSP/src/arch/posix/csp_time.d \
./CSP/src/arch/posix/pthread_queue.d 


# Each subdirectory must supply rules for building sources it contributes
CSP/src/arch/posix/%.o CSP/src/arch/posix/%.su CSP/src/arch/posix/%.cyclo: ../CSP/src/arch/posix/%.c CSP/src/arch/posix/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/TASK_Y4/F405_CAN/Tests" -I"D:/TASK_Y4/F405_CAN/CSP" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver/include" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Driver/src" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface/include" -I"D:/TASK_Y4/F405_CAN/CSP/CAN Interface/src" -I"D:/TASK_Y4/F405_CAN/CSP/include" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/arch" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/crypto" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/drivers" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/freertos" -I"D:/TASK_Y4/F405_CAN/CSP/src/drivers/can" -I"D:/TASK_Y4/F405_CAN/CSP/src/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/posix" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CSP-2f-src-2f-arch-2f-posix

clean-CSP-2f-src-2f-arch-2f-posix:
	-$(RM) ./CSP/src/arch/posix/csp_clock.cyclo ./CSP/src/arch/posix/csp_clock.d ./CSP/src/arch/posix/csp_clock.o ./CSP/src/arch/posix/csp_clock.su ./CSP/src/arch/posix/csp_queue.cyclo ./CSP/src/arch/posix/csp_queue.d ./CSP/src/arch/posix/csp_queue.o ./CSP/src/arch/posix/csp_queue.su ./CSP/src/arch/posix/csp_semaphore.cyclo ./CSP/src/arch/posix/csp_semaphore.d ./CSP/src/arch/posix/csp_semaphore.o ./CSP/src/arch/posix/csp_semaphore.su ./CSP/src/arch/posix/csp_system.cyclo ./CSP/src/arch/posix/csp_system.d ./CSP/src/arch/posix/csp_system.o ./CSP/src/arch/posix/csp_system.su ./CSP/src/arch/posix/csp_time.cyclo ./CSP/src/arch/posix/csp_time.d ./CSP/src/arch/posix/csp_time.o ./CSP/src/arch/posix/csp_time.su ./CSP/src/arch/posix/pthread_queue.cyclo ./CSP/src/arch/posix/pthread_queue.d ./CSP/src/arch/posix/pthread_queue.o ./CSP/src/arch/posix/pthread_queue.su

.PHONY: clean-CSP-2f-src-2f-arch-2f-posix

