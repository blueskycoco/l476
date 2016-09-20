#******************************************************************************
#
# Makefile - Rules for building the uart_echo example.
#
# Copyright (c) 2013-2014 Texas Instruments Incorporated.  All rights reserved.
# Software License Agreement
# 
# Texas Instruments (TI) is supplying this software for use solely and
# exclusively on TI's microcontroller products. The software is owned by
# TI and/or its suppliers, and is protected under applicable copyright
# laws. You may not combine this software with "viral" open-source
# software in order to form a larger program.
# 
# THIS SOFTWARE IS PROVIDED "AS IS" AND WITH ALL FAULTS.
# NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT
# NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. TI SHALL NOT, UNDER ANY
# CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
# DAMAGES, FOR ANY REASON WHATSOEVER.
# 
# This is part of revision 2.1.0.12573 of the EK-TM4C1294XL Firmware Package.
#
#******************************************************************************

#
# The base directory for TivaWare.
#
ROOT=.

#
# Include the common make definitions.
#
include ${ROOT}/makedefs

#
# Where to find header files that do not live in the source directory.
#
IPATH=./src/CMSIS/Include
IPATH+=./src/Main/inc
IPATH+=./src/FatFs/src
IPATH+=./src/FatFs/src/drivers
IPATH+=./src/FatFs/src/option
IPATH+=./src/STM32L4xx_HAL_Driver/Inc
VPATH=./src/STM32L4xx_HAL_Driver/Src
VPATH+=./src/FatFs/src
VPATH+=./src/FatFs/src/drivers
VPATH+=./src/FatFs/src/option
VPATH+=./src/Main/src
VPATH+=./src/ARM
#
# The default rule, which causes the uart_echo example to be built.
#
all: ${COMPILER}
all: ${COMPILER}/l476rg.axf

#
# The rule to clean out all the build products.
#
clean:
	@rm -rf ${COMPILER} ${wildcard *~}
install:
#	openocd -f openocd.cfg -c "flash_image"
	jlink.exe burn.txt

#
# The rule to create the target directory.
#
${COMPILER}:
	@mkdir -p ${COMPILER}

#
# Rules for building the uart_echo example.
#
${COMPILER}/l476rg.axf: ${COMPILER}/startup_stm32l476xx.o
${COMPILER}/l476rg.axf: ${COMPILER}/syscalls.o
${COMPILER}/l476rg.axf: ${COMPILER}/main.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_it.o
${COMPILER}/l476rg.axf: ${COMPILER}/system_stm32l4xx.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_cortex.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_gpio.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_pcd.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_pcd_ex.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_pwr.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_pwr_ex.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_dma.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_rcc.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_rcc_ex.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_uart.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_spi.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_spi_ex.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_flash.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_tim_ex.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_tim.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_dac.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_dac_ex.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_rtc.o
${COMPILER}/l476rg.axf: ${COMPILER}/stm32l4xx_hal_rtc_ex.o
#${COMPILER}/l476rg.axf: ${COMPILER}/diskio.o
#${COMPILER}/l476rg.axf: ${COMPILER}/ff.o
#${COMPILER}/l476rg.axf: ${COMPILER}/ff_gen_drv.o
#${COMPILER}/l476rg.axf: ${COMPILER}/cc936.o
#${COMPILER}/l476rg.axf: ${COMPILER}/ccsbcs.o
#${COMPILER}/l476rg.axf: ${COMPILER}/syscall.o
#${COMPILER}/l476rg.axf: ${COMPILER}/unicode.o
${COMPILER}/l476rg.axf: stm32l4xx_flash.ld
SCATTERgcc_l476rg=stm32l4xx_flash.ld
ENTRY_l476rg=Reset_Handler
CFLAGSgcc=-DSTM32L476xx -DUSE_HAL_DRIVER -DUSE_STM32L4xx_NUCLEO

#
# Include the automatically generated dependency files.
#
ifneq (${MAKECMDGOALS},clean)
-include ${wildcard ${COMPILER}/*.d} __dummy__
endif
