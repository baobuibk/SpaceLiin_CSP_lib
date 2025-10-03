################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DEV/libcsp/src/arch/freertos/csp_clock.c \
../DEV/libcsp/src/arch/freertos/csp_malloc.c \
../DEV/libcsp/src/arch/freertos/csp_queue.c \
../DEV/libcsp/src/arch/freertos/csp_semaphore.c \
../DEV/libcsp/src/arch/freertos/csp_system.c \
../DEV/libcsp/src/arch/freertos/csp_thread.c \
../DEV/libcsp/src/arch/freertos/csp_time.c 

OBJS += \
./DEV/libcsp/src/arch/freertos/csp_clock.o \
./DEV/libcsp/src/arch/freertos/csp_malloc.o \
./DEV/libcsp/src/arch/freertos/csp_queue.o \
./DEV/libcsp/src/arch/freertos/csp_semaphore.o \
./DEV/libcsp/src/arch/freertos/csp_system.o \
./DEV/libcsp/src/arch/freertos/csp_thread.o \
./DEV/libcsp/src/arch/freertos/csp_time.o 

C_DEPS += \
./DEV/libcsp/src/arch/freertos/csp_clock.d \
./DEV/libcsp/src/arch/freertos/csp_malloc.d \
./DEV/libcsp/src/arch/freertos/csp_queue.d \
./DEV/libcsp/src/arch/freertos/csp_semaphore.d \
./DEV/libcsp/src/arch/freertos/csp_system.d \
./DEV/libcsp/src/arch/freertos/csp_thread.d \
./DEV/libcsp/src/arch/freertos/csp_time.d 


# Each subdirectory must supply rules for building sources it contributes
DEV/libcsp/src/arch/freertos/%.o DEV/libcsp/src/arch/freertos/%.su DEV/libcsp/src/arch/freertos/%.cyclo: ../DEV/libcsp/src/arch/freertos/%.c DEV/libcsp/src/arch/freertos/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -DUSE_FULL_LL_DRIVER -c -I../Core/Inc -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/interfaces" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/drivers" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/crypto" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/arch" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/transport" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/rtable" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/interfaces" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/drivers" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/crypto" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/bindings" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/arch" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-DEV-2f-libcsp-2f-src-2f-arch-2f-freertos

clean-DEV-2f-libcsp-2f-src-2f-arch-2f-freertos:
	-$(RM) ./DEV/libcsp/src/arch/freertos/csp_clock.cyclo ./DEV/libcsp/src/arch/freertos/csp_clock.d ./DEV/libcsp/src/arch/freertos/csp_clock.o ./DEV/libcsp/src/arch/freertos/csp_clock.su ./DEV/libcsp/src/arch/freertos/csp_malloc.cyclo ./DEV/libcsp/src/arch/freertos/csp_malloc.d ./DEV/libcsp/src/arch/freertos/csp_malloc.o ./DEV/libcsp/src/arch/freertos/csp_malloc.su ./DEV/libcsp/src/arch/freertos/csp_queue.cyclo ./DEV/libcsp/src/arch/freertos/csp_queue.d ./DEV/libcsp/src/arch/freertos/csp_queue.o ./DEV/libcsp/src/arch/freertos/csp_queue.su ./DEV/libcsp/src/arch/freertos/csp_semaphore.cyclo ./DEV/libcsp/src/arch/freertos/csp_semaphore.d ./DEV/libcsp/src/arch/freertos/csp_semaphore.o ./DEV/libcsp/src/arch/freertos/csp_semaphore.su ./DEV/libcsp/src/arch/freertos/csp_system.cyclo ./DEV/libcsp/src/arch/freertos/csp_system.d ./DEV/libcsp/src/arch/freertos/csp_system.o ./DEV/libcsp/src/arch/freertos/csp_system.su ./DEV/libcsp/src/arch/freertos/csp_thread.cyclo ./DEV/libcsp/src/arch/freertos/csp_thread.d ./DEV/libcsp/src/arch/freertos/csp_thread.o ./DEV/libcsp/src/arch/freertos/csp_thread.su ./DEV/libcsp/src/arch/freertos/csp_time.cyclo ./DEV/libcsp/src/arch/freertos/csp_time.d ./DEV/libcsp/src/arch/freertos/csp_time.o ./DEV/libcsp/src/arch/freertos/csp_time.su

.PHONY: clean-DEV-2f-libcsp-2f-src-2f-arch-2f-freertos

