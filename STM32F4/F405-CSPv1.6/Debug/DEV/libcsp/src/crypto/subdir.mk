################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DEV/libcsp/src/crypto/csp_hmac.c \
../DEV/libcsp/src/crypto/csp_sha1.c \
../DEV/libcsp/src/crypto/csp_xtea.c 

OBJS += \
./DEV/libcsp/src/crypto/csp_hmac.o \
./DEV/libcsp/src/crypto/csp_sha1.o \
./DEV/libcsp/src/crypto/csp_xtea.o 

C_DEPS += \
./DEV/libcsp/src/crypto/csp_hmac.d \
./DEV/libcsp/src/crypto/csp_sha1.d \
./DEV/libcsp/src/crypto/csp_xtea.d 


# Each subdirectory must supply rules for building sources it contributes
DEV/libcsp/src/crypto/%.o DEV/libcsp/src/crypto/%.su DEV/libcsp/src/crypto/%.cyclo: ../DEV/libcsp/src/crypto/%.c DEV/libcsp/src/crypto/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -DUSE_FULL_LL_DRIVER -c -I../Core/Inc -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/interfaces" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/drivers" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/crypto" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/include/csp/arch" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/transport" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/rtable" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/interfaces" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/drivers" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/crypto" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/bindings" -I"D:/tmp/F405-CSPv1.6/DEV/libcsp/src/arch" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-DEV-2f-libcsp-2f-src-2f-crypto

clean-DEV-2f-libcsp-2f-src-2f-crypto:
	-$(RM) ./DEV/libcsp/src/crypto/csp_hmac.cyclo ./DEV/libcsp/src/crypto/csp_hmac.d ./DEV/libcsp/src/crypto/csp_hmac.o ./DEV/libcsp/src/crypto/csp_hmac.su ./DEV/libcsp/src/crypto/csp_sha1.cyclo ./DEV/libcsp/src/crypto/csp_sha1.d ./DEV/libcsp/src/crypto/csp_sha1.o ./DEV/libcsp/src/crypto/csp_sha1.su ./DEV/libcsp/src/crypto/csp_xtea.cyclo ./DEV/libcsp/src/crypto/csp_xtea.d ./DEV/libcsp/src/crypto/csp_xtea.o ./DEV/libcsp/src/crypto/csp_xtea.su

.PHONY: clean-DEV-2f-libcsp-2f-src-2f-crypto

