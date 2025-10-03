################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DEV/libcsp/src/drivers/usart/usart_kiss.c \
../DEV/libcsp/src/drivers/usart/usart_linux.c \
../DEV/libcsp/src/drivers/usart/usart_windows.c 

OBJS += \
./DEV/libcsp/src/drivers/usart/usart_kiss.o \
./DEV/libcsp/src/drivers/usart/usart_linux.o \
./DEV/libcsp/src/drivers/usart/usart_windows.o 

C_DEPS += \
./DEV/libcsp/src/drivers/usart/usart_kiss.d \
./DEV/libcsp/src/drivers/usart/usart_linux.d \
./DEV/libcsp/src/drivers/usart/usart_windows.d 


# Each subdirectory must supply rules for building sources it contributes
DEV/libcsp/src/drivers/usart/%.o DEV/libcsp/src/drivers/usart/%.su DEV/libcsp/src/drivers/usart/%.cyclo: ../DEV/libcsp/src/drivers/usart/%.c DEV/libcsp/src/drivers/usart/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/interfaces" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/drivers" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/crypto" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/arch" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/transport" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/rtable" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/interfaces" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/drivers" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/crypto" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/bindings" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/arch" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-DEV-2f-libcsp-2f-src-2f-drivers-2f-usart

clean-DEV-2f-libcsp-2f-src-2f-drivers-2f-usart:
	-$(RM) ./DEV/libcsp/src/drivers/usart/usart_kiss.cyclo ./DEV/libcsp/src/drivers/usart/usart_kiss.d ./DEV/libcsp/src/drivers/usart/usart_kiss.o ./DEV/libcsp/src/drivers/usart/usart_kiss.su ./DEV/libcsp/src/drivers/usart/usart_linux.cyclo ./DEV/libcsp/src/drivers/usart/usart_linux.d ./DEV/libcsp/src/drivers/usart/usart_linux.o ./DEV/libcsp/src/drivers/usart/usart_linux.su ./DEV/libcsp/src/drivers/usart/usart_windows.cyclo ./DEV/libcsp/src/drivers/usart/usart_windows.d ./DEV/libcsp/src/drivers/usart/usart_windows.o ./DEV/libcsp/src/drivers/usart/usart_windows.su

.PHONY: clean-DEV-2f-libcsp-2f-src-2f-drivers-2f-usart

