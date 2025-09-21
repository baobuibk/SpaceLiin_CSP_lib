################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CSP/src/csp_bridge.c \
../CSP/src/csp_buffer.c \
../CSP/src/csp_conn.c \
../CSP/src/csp_crc32.c \
../CSP/src/csp_debug.c \
../CSP/src/csp_dedup.c \
../CSP/src/csp_endian.c \
../CSP/src/csp_hex_dump.c \
../CSP/src/csp_id.c \
../CSP/src/csp_iflist.c \
../CSP/src/csp_init.c \
../CSP/src/csp_io.c \
../CSP/src/csp_port.c \
../CSP/src/csp_promisc.c \
../CSP/src/csp_qfifo.c \
../CSP/src/csp_rdp.c \
../CSP/src/csp_rdp_queue.c \
../CSP/src/csp_route.c \
../CSP/src/csp_rtable_cidr.c \
../CSP/src/csp_service_handler.c \
../CSP/src/csp_services.c \
../CSP/src/csp_sfp.c 

OBJS += \
./CSP/src/csp_bridge.o \
./CSP/src/csp_buffer.o \
./CSP/src/csp_conn.o \
./CSP/src/csp_crc32.o \
./CSP/src/csp_debug.o \
./CSP/src/csp_dedup.o \
./CSP/src/csp_endian.o \
./CSP/src/csp_hex_dump.o \
./CSP/src/csp_id.o \
./CSP/src/csp_iflist.o \
./CSP/src/csp_init.o \
./CSP/src/csp_io.o \
./CSP/src/csp_port.o \
./CSP/src/csp_promisc.o \
./CSP/src/csp_qfifo.o \
./CSP/src/csp_rdp.o \
./CSP/src/csp_rdp_queue.o \
./CSP/src/csp_route.o \
./CSP/src/csp_rtable_cidr.o \
./CSP/src/csp_service_handler.o \
./CSP/src/csp_services.o \
./CSP/src/csp_sfp.o 

C_DEPS += \
./CSP/src/csp_bridge.d \
./CSP/src/csp_buffer.d \
./CSP/src/csp_conn.d \
./CSP/src/csp_crc32.d \
./CSP/src/csp_debug.d \
./CSP/src/csp_dedup.d \
./CSP/src/csp_endian.d \
./CSP/src/csp_hex_dump.d \
./CSP/src/csp_id.d \
./CSP/src/csp_iflist.d \
./CSP/src/csp_init.d \
./CSP/src/csp_io.d \
./CSP/src/csp_port.d \
./CSP/src/csp_promisc.d \
./CSP/src/csp_qfifo.d \
./CSP/src/csp_rdp.d \
./CSP/src/csp_rdp_queue.d \
./CSP/src/csp_route.d \
./CSP/src/csp_rtable_cidr.d \
./CSP/src/csp_service_handler.d \
./CSP/src/csp_services.d \
./CSP/src/csp_sfp.d 


# Each subdirectory must supply rules for building sources it contributes
CSP/src/%.o CSP/src/%.su CSP/src/%.cyclo: ../CSP/src/%.c CSP/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -DUSE_FULL_LL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/TASK_Y4/F405_CAN/Tests" -I"D:/TASK_Y4/F405_CAN/CSP" -I"D:/TASK_Y4/F405_CAN/CSP/include" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/arch" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/crypto" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/drivers" -I"D:/TASK_Y4/F405_CAN/CSP/include/csp/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/freertos" -I"D:/TASK_Y4/F405_CAN/CSP/src/drivers/can" -I"D:/TASK_Y4/F405_CAN/CSP/src/interfaces" -I"D:/TASK_Y4/F405_CAN/CSP/src/arch/posix" -I"D:/TASK_Y4/F405_CAN/Services/Logger" -I"D:/TASK_Y4/F405_CAN/CSP/can_stm32" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CSP-2f-src

clean-CSP-2f-src:
	-$(RM) ./CSP/src/csp_bridge.cyclo ./CSP/src/csp_bridge.d ./CSP/src/csp_bridge.o ./CSP/src/csp_bridge.su ./CSP/src/csp_buffer.cyclo ./CSP/src/csp_buffer.d ./CSP/src/csp_buffer.o ./CSP/src/csp_buffer.su ./CSP/src/csp_conn.cyclo ./CSP/src/csp_conn.d ./CSP/src/csp_conn.o ./CSP/src/csp_conn.su ./CSP/src/csp_crc32.cyclo ./CSP/src/csp_crc32.d ./CSP/src/csp_crc32.o ./CSP/src/csp_crc32.su ./CSP/src/csp_debug.cyclo ./CSP/src/csp_debug.d ./CSP/src/csp_debug.o ./CSP/src/csp_debug.su ./CSP/src/csp_dedup.cyclo ./CSP/src/csp_dedup.d ./CSP/src/csp_dedup.o ./CSP/src/csp_dedup.su ./CSP/src/csp_endian.cyclo ./CSP/src/csp_endian.d ./CSP/src/csp_endian.o ./CSP/src/csp_endian.su ./CSP/src/csp_hex_dump.cyclo ./CSP/src/csp_hex_dump.d ./CSP/src/csp_hex_dump.o ./CSP/src/csp_hex_dump.su ./CSP/src/csp_id.cyclo ./CSP/src/csp_id.d ./CSP/src/csp_id.o ./CSP/src/csp_id.su ./CSP/src/csp_iflist.cyclo ./CSP/src/csp_iflist.d ./CSP/src/csp_iflist.o ./CSP/src/csp_iflist.su ./CSP/src/csp_init.cyclo ./CSP/src/csp_init.d ./CSP/src/csp_init.o ./CSP/src/csp_init.su ./CSP/src/csp_io.cyclo ./CSP/src/csp_io.d ./CSP/src/csp_io.o ./CSP/src/csp_io.su ./CSP/src/csp_port.cyclo ./CSP/src/csp_port.d ./CSP/src/csp_port.o ./CSP/src/csp_port.su ./CSP/src/csp_promisc.cyclo ./CSP/src/csp_promisc.d ./CSP/src/csp_promisc.o ./CSP/src/csp_promisc.su ./CSP/src/csp_qfifo.cyclo ./CSP/src/csp_qfifo.d ./CSP/src/csp_qfifo.o ./CSP/src/csp_qfifo.su ./CSP/src/csp_rdp.cyclo ./CSP/src/csp_rdp.d ./CSP/src/csp_rdp.o ./CSP/src/csp_rdp.su ./CSP/src/csp_rdp_queue.cyclo ./CSP/src/csp_rdp_queue.d ./CSP/src/csp_rdp_queue.o ./CSP/src/csp_rdp_queue.su ./CSP/src/csp_route.cyclo ./CSP/src/csp_route.d ./CSP/src/csp_route.o ./CSP/src/csp_route.su ./CSP/src/csp_rtable_cidr.cyclo ./CSP/src/csp_rtable_cidr.d ./CSP/src/csp_rtable_cidr.o ./CSP/src/csp_rtable_cidr.su ./CSP/src/csp_service_handler.cyclo ./CSP/src/csp_service_handler.d ./CSP/src/csp_service_handler.o ./CSP/src/csp_service_handler.su ./CSP/src/csp_services.cyclo ./CSP/src/csp_services.d ./CSP/src/csp_services.o ./CSP/src/csp_services.su ./CSP/src/csp_sfp.cyclo ./CSP/src/csp_sfp.d ./CSP/src/csp_sfp.o ./CSP/src/csp_sfp.su

.PHONY: clean-CSP-2f-src

