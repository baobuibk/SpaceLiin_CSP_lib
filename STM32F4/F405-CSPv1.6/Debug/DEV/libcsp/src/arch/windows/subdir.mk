################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DEV/libcsp/src/arch/windows/csp_clock.c \
../DEV/libcsp/src/arch/windows/csp_malloc.c \
../DEV/libcsp/src/arch/windows/csp_queue.c \
../DEV/libcsp/src/arch/windows/csp_semaphore.c \
../DEV/libcsp/src/arch/windows/csp_system.c \
../DEV/libcsp/src/arch/windows/csp_thread.c \
../DEV/libcsp/src/arch/windows/csp_time.c \
../DEV/libcsp/src/arch/windows/windows_queue.c 

OBJS += \
./DEV/libcsp/src/arch/windows/csp_clock.o \
./DEV/libcsp/src/arch/windows/csp_malloc.o \
./DEV/libcsp/src/arch/windows/csp_queue.o \
./DEV/libcsp/src/arch/windows/csp_semaphore.o \
./DEV/libcsp/src/arch/windows/csp_system.o \
./DEV/libcsp/src/arch/windows/csp_thread.o \
./DEV/libcsp/src/arch/windows/csp_time.o \
./DEV/libcsp/src/arch/windows/windows_queue.o 

C_DEPS += \
./DEV/libcsp/src/arch/windows/csp_clock.d \
./DEV/libcsp/src/arch/windows/csp_malloc.d \
./DEV/libcsp/src/arch/windows/csp_queue.d \
./DEV/libcsp/src/arch/windows/csp_semaphore.d \
./DEV/libcsp/src/arch/windows/csp_system.d \
./DEV/libcsp/src/arch/windows/csp_thread.d \
./DEV/libcsp/src/arch/windows/csp_time.d \
./DEV/libcsp/src/arch/windows/windows_queue.d 


# Each subdirectory must supply rules for building sources it contributes
DEV/libcsp/src/arch/windows/%.o DEV/libcsp/src/arch/windows/%.su DEV/libcsp/src/arch/windows/%.cyclo: ../DEV/libcsp/src/arch/windows/%.c DEV/libcsp/src/arch/windows/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/interfaces" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/drivers" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/crypto" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/arch" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/transport" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/rtable" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/interfaces" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/drivers" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/crypto" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/bindings" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/arch" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-DEV-2f-libcsp-2f-src-2f-arch-2f-windows

clean-DEV-2f-libcsp-2f-src-2f-arch-2f-windows:
	-$(RM) ./DEV/libcsp/src/arch/windows/csp_clock.cyclo ./DEV/libcsp/src/arch/windows/csp_clock.d ./DEV/libcsp/src/arch/windows/csp_clock.o ./DEV/libcsp/src/arch/windows/csp_clock.su ./DEV/libcsp/src/arch/windows/csp_malloc.cyclo ./DEV/libcsp/src/arch/windows/csp_malloc.d ./DEV/libcsp/src/arch/windows/csp_malloc.o ./DEV/libcsp/src/arch/windows/csp_malloc.su ./DEV/libcsp/src/arch/windows/csp_queue.cyclo ./DEV/libcsp/src/arch/windows/csp_queue.d ./DEV/libcsp/src/arch/windows/csp_queue.o ./DEV/libcsp/src/arch/windows/csp_queue.su ./DEV/libcsp/src/arch/windows/csp_semaphore.cyclo ./DEV/libcsp/src/arch/windows/csp_semaphore.d ./DEV/libcsp/src/arch/windows/csp_semaphore.o ./DEV/libcsp/src/arch/windows/csp_semaphore.su ./DEV/libcsp/src/arch/windows/csp_system.cyclo ./DEV/libcsp/src/arch/windows/csp_system.d ./DEV/libcsp/src/arch/windows/csp_system.o ./DEV/libcsp/src/arch/windows/csp_system.su ./DEV/libcsp/src/arch/windows/csp_thread.cyclo ./DEV/libcsp/src/arch/windows/csp_thread.d ./DEV/libcsp/src/arch/windows/csp_thread.o ./DEV/libcsp/src/arch/windows/csp_thread.su ./DEV/libcsp/src/arch/windows/csp_time.cyclo ./DEV/libcsp/src/arch/windows/csp_time.d ./DEV/libcsp/src/arch/windows/csp_time.o ./DEV/libcsp/src/arch/windows/csp_time.su ./DEV/libcsp/src/arch/windows/windows_queue.cyclo ./DEV/libcsp/src/arch/windows/windows_queue.d ./DEV/libcsp/src/arch/windows/windows_queue.o ./DEV/libcsp/src/arch/windows/windows_queue.su

.PHONY: clean-DEV-2f-libcsp-2f-src-2f-arch-2f-windows

