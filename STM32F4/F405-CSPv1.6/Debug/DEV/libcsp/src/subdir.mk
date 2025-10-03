################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DEV/libcsp/src/csp_bridge.c \
../DEV/libcsp/src/csp_buffer.c \
../DEV/libcsp/src/csp_conn.c \
../DEV/libcsp/src/csp_crc32.c \
../DEV/libcsp/src/csp_debug.c \
../DEV/libcsp/src/csp_dedup.c \
../DEV/libcsp/src/csp_endian.c \
../DEV/libcsp/src/csp_hex_dump.c \
../DEV/libcsp/src/csp_iflist.c \
../DEV/libcsp/src/csp_init.c \
../DEV/libcsp/src/csp_io.c \
../DEV/libcsp/src/csp_port.c \
../DEV/libcsp/src/csp_promisc.c \
../DEV/libcsp/src/csp_qfifo.c \
../DEV/libcsp/src/csp_route.c \
../DEV/libcsp/src/csp_service_handler.c \
../DEV/libcsp/src/csp_services.c \
../DEV/libcsp/src/csp_sfp.c 

OBJS += \
./DEV/libcsp/src/csp_bridge.o \
./DEV/libcsp/src/csp_buffer.o \
./DEV/libcsp/src/csp_conn.o \
./DEV/libcsp/src/csp_crc32.o \
./DEV/libcsp/src/csp_debug.o \
./DEV/libcsp/src/csp_dedup.o \
./DEV/libcsp/src/csp_endian.o \
./DEV/libcsp/src/csp_hex_dump.o \
./DEV/libcsp/src/csp_iflist.o \
./DEV/libcsp/src/csp_init.o \
./DEV/libcsp/src/csp_io.o \
./DEV/libcsp/src/csp_port.o \
./DEV/libcsp/src/csp_promisc.o \
./DEV/libcsp/src/csp_qfifo.o \
./DEV/libcsp/src/csp_route.o \
./DEV/libcsp/src/csp_service_handler.o \
./DEV/libcsp/src/csp_services.o \
./DEV/libcsp/src/csp_sfp.o 

C_DEPS += \
./DEV/libcsp/src/csp_bridge.d \
./DEV/libcsp/src/csp_buffer.d \
./DEV/libcsp/src/csp_conn.d \
./DEV/libcsp/src/csp_crc32.d \
./DEV/libcsp/src/csp_debug.d \
./DEV/libcsp/src/csp_dedup.d \
./DEV/libcsp/src/csp_endian.d \
./DEV/libcsp/src/csp_hex_dump.d \
./DEV/libcsp/src/csp_iflist.d \
./DEV/libcsp/src/csp_init.d \
./DEV/libcsp/src/csp_io.d \
./DEV/libcsp/src/csp_port.d \
./DEV/libcsp/src/csp_promisc.d \
./DEV/libcsp/src/csp_qfifo.d \
./DEV/libcsp/src/csp_route.d \
./DEV/libcsp/src/csp_service_handler.d \
./DEV/libcsp/src/csp_services.d \
./DEV/libcsp/src/csp_sfp.d 


# Each subdirectory must supply rules for building sources it contributes
DEV/libcsp/src/%.o DEV/libcsp/src/%.su DEV/libcsp/src/%.cyclo: ../DEV/libcsp/src/%.c DEV/libcsp/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -DUSE_FULL_LL_DRIVER -c -I../Core/Inc -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/interfaces" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/drivers" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/crypto" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/arch" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/transport" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/rtable" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/interfaces" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/drivers" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/crypto" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/bindings" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/arch" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-DEV-2f-libcsp-2f-src

clean-DEV-2f-libcsp-2f-src:
	-$(RM) ./DEV/libcsp/src/csp_bridge.cyclo ./DEV/libcsp/src/csp_bridge.d ./DEV/libcsp/src/csp_bridge.o ./DEV/libcsp/src/csp_bridge.su ./DEV/libcsp/src/csp_buffer.cyclo ./DEV/libcsp/src/csp_buffer.d ./DEV/libcsp/src/csp_buffer.o ./DEV/libcsp/src/csp_buffer.su ./DEV/libcsp/src/csp_conn.cyclo ./DEV/libcsp/src/csp_conn.d ./DEV/libcsp/src/csp_conn.o ./DEV/libcsp/src/csp_conn.su ./DEV/libcsp/src/csp_crc32.cyclo ./DEV/libcsp/src/csp_crc32.d ./DEV/libcsp/src/csp_crc32.o ./DEV/libcsp/src/csp_crc32.su ./DEV/libcsp/src/csp_debug.cyclo ./DEV/libcsp/src/csp_debug.d ./DEV/libcsp/src/csp_debug.o ./DEV/libcsp/src/csp_debug.su ./DEV/libcsp/src/csp_dedup.cyclo ./DEV/libcsp/src/csp_dedup.d ./DEV/libcsp/src/csp_dedup.o ./DEV/libcsp/src/csp_dedup.su ./DEV/libcsp/src/csp_endian.cyclo ./DEV/libcsp/src/csp_endian.d ./DEV/libcsp/src/csp_endian.o ./DEV/libcsp/src/csp_endian.su ./DEV/libcsp/src/csp_hex_dump.cyclo ./DEV/libcsp/src/csp_hex_dump.d ./DEV/libcsp/src/csp_hex_dump.o ./DEV/libcsp/src/csp_hex_dump.su ./DEV/libcsp/src/csp_iflist.cyclo ./DEV/libcsp/src/csp_iflist.d ./DEV/libcsp/src/csp_iflist.o ./DEV/libcsp/src/csp_iflist.su ./DEV/libcsp/src/csp_init.cyclo ./DEV/libcsp/src/csp_init.d ./DEV/libcsp/src/csp_init.o ./DEV/libcsp/src/csp_init.su ./DEV/libcsp/src/csp_io.cyclo ./DEV/libcsp/src/csp_io.d ./DEV/libcsp/src/csp_io.o ./DEV/libcsp/src/csp_io.su ./DEV/libcsp/src/csp_port.cyclo ./DEV/libcsp/src/csp_port.d ./DEV/libcsp/src/csp_port.o ./DEV/libcsp/src/csp_port.su ./DEV/libcsp/src/csp_promisc.cyclo ./DEV/libcsp/src/csp_promisc.d ./DEV/libcsp/src/csp_promisc.o ./DEV/libcsp/src/csp_promisc.su ./DEV/libcsp/src/csp_qfifo.cyclo ./DEV/libcsp/src/csp_qfifo.d ./DEV/libcsp/src/csp_qfifo.o ./DEV/libcsp/src/csp_qfifo.su ./DEV/libcsp/src/csp_route.cyclo ./DEV/libcsp/src/csp_route.d ./DEV/libcsp/src/csp_route.o ./DEV/libcsp/src/csp_route.su ./DEV/libcsp/src/csp_service_handler.cyclo ./DEV/libcsp/src/csp_service_handler.d ./DEV/libcsp/src/csp_service_handler.o ./DEV/libcsp/src/csp_service_handler.su ./DEV/libcsp/src/csp_services.cyclo ./DEV/libcsp/src/csp_services.d ./DEV/libcsp/src/csp_services.o ./DEV/libcsp/src/csp_services.su ./DEV/libcsp/src/csp_sfp.cyclo ./DEV/libcsp/src/csp_sfp.d ./DEV/libcsp/src/csp_sfp.o ./DEV/libcsp/src/csp_sfp.su

.PHONY: clean-DEV-2f-libcsp-2f-src

