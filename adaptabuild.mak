# ----------------------------------------------------------------------------
# pico-sdk library makefile
#
# This is designed to be included as part of a make system designed
# to be expandable and maintainable using techniques found in:
#
# Managing Projects with GNU Make - Robert Mecklenburg - ISBN 0-596-00610-1
# ----------------------------------------------------------------------------

MODULE := pico-sdk

MODULE_PATH := $(call make_current_module_path)
$(call log_debug,MODULE_PATH is $(MODULE_PATH))

$(MODULE)_PATH := $(MODULE_PATH)
$(call log_debug,$(MODULE)_PATH is $($(MODULE)_PATH))

# ----------------------------------------------------------------------------
# Source file lists go here, C dependencies are automatically generated
# by the compiler using the -m option
#
# You can set up a common source path late in the file
#
# Note that each module gets its own, privately scoped variable for building
# ----------------------------------------------------------------------------

# We need both else a previous definition is used :-) Can we make this an include?

SRC_C :=
SRC_ASM :=

# SRC_C += drivers/src/nrfx_adc.c
# SRC_C += drivers/src/nrfx_bellboard.c
# SRC_C += drivers/src/nrfx_clock.c
# SRC_C += drivers/src/nrfx_comp.c
# SRC_C += drivers/src/nrfx_dppi.c
# SRC_C += drivers/src/nrfx_egu.c
# SRC_C += drivers/src/nrfx_gpiote.c
# SRC_C += drivers/src/nrfx_grtc.c
# SRC_C += drivers/src/nrfx_i2s.c
# SRC_C += drivers/src/nrfx_ipc.c
# SRC_C += drivers/src/nrfx_lpcomp.c
# SRC_C += drivers/src/nrfx_nfct.c
# SRC_C += drivers/src/nrfx_nvmc.c
# SRC_C += drivers/src/nrfx_pdm.c
# SRC_C += drivers/src/nrfx_power.c
# SRC_C += drivers/src/nrfx_ppi.c
# SRC_C += drivers/src/nrfx_pwm.c
# SRC_C += drivers/src/nrfx_qdec.c
# SRC_C += drivers/src/nrfx_qspi.c
# SRC_C += drivers/src/nrfx_rng.c
# SRC_C += drivers/src/nrfx_rramc.c
# SRC_C += drivers/src/nrfx_rtc.c
# SRC_C += drivers/src/nrfx_saadc.c
# SRC_C += drivers/src/nrfx_spi.c
# SRC_C += drivers/src/nrfx_spim.c
# SRC_C += drivers/src/nrfx_spis.c
# SRC_C += drivers/src/nrfx_systick.c
# SRC_C += drivers/src/nrfx_tbm.c
# SRC_C += drivers/src/nrfx_temp.c
# SRC_C += drivers/src/nrfx_timer.c
# SRC_C += drivers/src/nrfx_twi.c
# SRC_C += drivers/src/nrfx_twim.c
# SRC_C += drivers/src/nrfx_twis.c
# SRC_C += drivers/src/nrfx_twi_twim.c
# SRC_C += drivers/src/nrfx_uart.c
# SRC_C += drivers/src/nrfx_uarte.c
# SRC_C += drivers/src/nrfx_usbd.c
# SRC_C += drivers/src/nrfx_usbreg.c
# SRC_C += drivers/src/nrfx_vevif.c
# SRC_C += drivers/src/nrfx_wdt.c
# 
# SRC_C += drivers/src/prs/nrfx_prs.c
# 
# SRC_C += mdk/startup_nrf_common.c
# SRC_C += mdk/$(MCU_SYSTEM_FILE).c
# 

SRC_C += src/rp2_common/pico_runtime/runtime.c
SRC_C += src/common/pico_sync/mutex.c
SRC_C += src/common/pico_sync/lock_core.c
SRC_C += src/common/pico_time/time.c
SRC_C += src/rp2_common/hardware_sync/sync.c
SRC_C += src/rp2_common/hardware_timer/timer.c
SRC_C += src/rp2_common/hardware_irq/irq.c
SRC_C += src/rp2_common/hardware_pll/pll.c
SRC_C += src/rp2_common/hardware_xosc/xosc.c
SRC_C += src/rp2_common/hardware_claim/claim.c
SRC_C += src/rp2_common/pico_bootrom/bootrom.c
SRC_C += src/rp2_common/hardware_gpio/gpio.c
SRC_C += src/common/pico_util/pheap.c
SRC_C += src/rp2_common/hardware_clocks/clocks.c
SRC_C += src/rp2_common/hardware_watchdog/watchdog.c

SRC_ASM += src/rp2_common/pico_standard_link/$(MCU_STARTUP_FILE)
SRC_ASM += src/rp2_common/hardware_irq/irq_handler_chain.S

SRC_ASM += src/rp2_common/boot_stage2/boot2_w25q080.S

# SYSTEM_STARTUP_OBJ := $(BUILD_PATH)/$(MODULE_PATH)/src/rp2_common/boot_stage2/boot2_w25q080.o
SYSTEM_BOOT_OBJ := $(BUILD_PATH)/$(MODULE_PATH)/src/rp2_common/boot_stage2/boot2_w25q080.o

# ----------------------------------------------------------------------------
# Set up the module level include path

$(MODULE)_INCPATH :=
# $(MODULE)_INCPATH += $(MODULE_PATH)
# $(MODULE)_INCPATH += $(MODULE_PATH)/mdk
# $(MODULE)_INCPATH += $(MODULE_PATH)/drivers/include
# $(MODULE)_INCPATH += $(MODULE_PATH)/drivers/include
# $(MODULE)_INCPATH += $(cmsis_core_PATH)/Include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/pico-sdk/src/boards/include/boards

$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/pico_platform/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/common/pico_base/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2040/hardware_regs/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/common/pico_binary_info/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/common/pico_time/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2040/hardware_structs/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/hardware_base/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/hardware_clocks/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/hardware_irq/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/hardware_resets/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/hardware_watchdog/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/hardware_pll/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/hardware_xosc/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/hardware_gpio/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/common/pico_sync/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/hardware_timer/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/hardware_sync/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/hardware_claim/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/common/pico_util/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/pico_bootrom/include
$(MODULE)_INCPATH += $(MODULE_PATH)/src/rp2_common/boot_stage2/asminclude

# ----------------------------------------------------------------------------
# NOTE: The default HAL config file must be created somehow - it is normally
#       up to the developer to specify which HAL elements are needed and how
#       they are to be configured.
#
# By convention we place config files in $(PRODUCT)/$(MCU) because
# that's an easy pace to leave things like HAL config, linker scripts etc

$(MODULE)_INCPATH += $(PRODUCT)/config/$(MCU)

# ---------------------------- ------------------------------------------------
# Set any module level compile time defaults here

$(MODULE)_CDEFS :=
$(MODULE)_CDEFS += PICO_BOARD=pico_w PICO_ON_DEVICE=1 PICO_PLATFORM=rp2040 PICO_NO_FLASH=1 PICO_STDIO_SEMIHOSTING=1 PICO_C_COMPILER_IS_GNU=1 PICO_NO_FPGA_CHECK=1 LIB_PICO_PRINTF_NONE=1

$(MODULE)_CFLAGS :=
$(MODULE)_CFLAGS +=

# ----------------------------------------------------------------------------
# Include the adaptabuild library makefile - must be done for each module!

include $(ADAPTABUILD_PATH)/make/library.mak

# ----------------------------------------------------------------------------
