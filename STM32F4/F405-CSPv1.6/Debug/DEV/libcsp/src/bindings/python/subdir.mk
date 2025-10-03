################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DEV/libcsp/src/bindings/python/pycsp.c 

OBJS += \
./DEV/libcsp/src/bindings/python/pycsp.o 

C_DEPS += \
./DEV/libcsp/src/bindings/python/pycsp.d 


# Each subdirectory must supply rules for building sources it contributes
DEV/libcsp/src/bindings/python/%.o DEV/libcsp/src/bindings/python/%.su DEV/libcsp/src/bindings/python/%.cyclo: ../DEV/libcsp/src/bindings/python/%.c DEV/libcsp/src/bindings/python/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/interfaces" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/drivers" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/crypto" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/include/csp/arch" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/transport" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/rtable" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/interfaces" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/drivers" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/crypto" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/bindings" -I"D:/STM32CubeIDE_1.13.2/F405-CSPv1.6/DEV/libcsp/src/arch" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-DEV-2f-libcsp-2f-src-2f-bindings-2f-python

clean-DEV-2f-libcsp-2f-src-2f-bindings-2f-python:
	-$(RM) ./DEV/libcsp/src/bindings/python/pycsp.cyclo ./DEV/libcsp/src/bindings/python/pycsp.d ./DEV/libcsp/src/bindings/python/pycsp.o ./DEV/libcsp/src/bindings/python/pycsp.su

.PHONY: clean-DEV-2f-libcsp-2f-src-2f-bindings-2f-python

