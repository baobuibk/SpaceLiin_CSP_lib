################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DEV/libcsp/src/interfaces/csp_if_can.c \
../DEV/libcsp/src/interfaces/csp_if_can_pbuf.c \
../DEV/libcsp/src/interfaces/csp_if_i2c.c \
../DEV/libcsp/src/interfaces/csp_if_kiss.c \
../DEV/libcsp/src/interfaces/csp_if_lo.c \
../DEV/libcsp/src/interfaces/csp_if_zmqhub.c 

OBJS += \
./DEV/libcsp/src/interfaces/csp_if_can.o \
./DEV/libcsp/src/interfaces/csp_if_can_pbuf.o \
./DEV/libcsp/src/interfaces/csp_if_i2c.o \
./DEV/libcsp/src/interfaces/csp_if_kiss.o \
./DEV/libcsp/src/interfaces/csp_if_lo.o \
./DEV/libcsp/src/interfaces/csp_if_zmqhub.o 

C_DEPS += \
./DEV/libcsp/src/interfaces/csp_if_can.d \
./DEV/libcsp/src/interfaces/csp_if_can_pbuf.d \
./DEV/libcsp/src/interfaces/csp_if_i2c.d \
./DEV/libcsp/src/interfaces/csp_if_kiss.d \
./DEV/libcsp/src/interfaces/csp_if_lo.d \
./DEV/libcsp/src/interfaces/csp_if_zmqhub.d 


# Each subdirectory must supply rules for building sources it contributes
DEV/libcsp/src/interfaces/%.o DEV/libcsp/src/interfaces/%.su DEV/libcsp/src/interfaces/%.cyclo: ../DEV/libcsp/src/interfaces/%.c DEV/libcsp/src/interfaces/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -DUSE_FULL_LL_DRIVER -c -I../Core/Inc -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/interfaces" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/drivers" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/crypto" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/arch" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/transport" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/rtable" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/interfaces" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/drivers" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/crypto" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/bindings" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/arch" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-DEV-2f-libcsp-2f-src-2f-interfaces

clean-DEV-2f-libcsp-2f-src-2f-interfaces:
	-$(RM) ./DEV/libcsp/src/interfaces/csp_if_can.cyclo ./DEV/libcsp/src/interfaces/csp_if_can.d ./DEV/libcsp/src/interfaces/csp_if_can.o ./DEV/libcsp/src/interfaces/csp_if_can.su ./DEV/libcsp/src/interfaces/csp_if_can_pbuf.cyclo ./DEV/libcsp/src/interfaces/csp_if_can_pbuf.d ./DEV/libcsp/src/interfaces/csp_if_can_pbuf.o ./DEV/libcsp/src/interfaces/csp_if_can_pbuf.su ./DEV/libcsp/src/interfaces/csp_if_i2c.cyclo ./DEV/libcsp/src/interfaces/csp_if_i2c.d ./DEV/libcsp/src/interfaces/csp_if_i2c.o ./DEV/libcsp/src/interfaces/csp_if_i2c.su ./DEV/libcsp/src/interfaces/csp_if_kiss.cyclo ./DEV/libcsp/src/interfaces/csp_if_kiss.d ./DEV/libcsp/src/interfaces/csp_if_kiss.o ./DEV/libcsp/src/interfaces/csp_if_kiss.su ./DEV/libcsp/src/interfaces/csp_if_lo.cyclo ./DEV/libcsp/src/interfaces/csp_if_lo.d ./DEV/libcsp/src/interfaces/csp_if_lo.o ./DEV/libcsp/src/interfaces/csp_if_lo.su ./DEV/libcsp/src/interfaces/csp_if_zmqhub.cyclo ./DEV/libcsp/src/interfaces/csp_if_zmqhub.d ./DEV/libcsp/src/interfaces/csp_if_zmqhub.o ./DEV/libcsp/src/interfaces/csp_if_zmqhub.su

.PHONY: clean-DEV-2f-libcsp-2f-src-2f-interfaces

