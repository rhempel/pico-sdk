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

SRC_C += src/rp2_common/cmsis/stub/CMSIS/Device/RP2040/Source/system_RP2040.c

SRC_C += src/common/pico_sync/mutex.c
SRC_C += src/common/pico_sync/lock_core.c
SRC_C += src/common/pico_time/time.c
SRC_C += src/common/pico_util/pheap.c

SRC_C += src/common/hardware_claim/claim.c

SRC_C += src/rp2_common/hardware_sync/sync.c
SRC_C += src/rp2_common/hardware_timer/timer.c
SRC_C += src/rp2_common/hardware_irq/irq.c
SRC_C += src/rp2_common/hardware_pll/pll.c
SRC_C += src/rp2_common/hardware_xosc/xosc.c
SRC_C += src/rp2_common/hardware_gpio/gpio.c
SRC_C += src/rp2_common/hardware_clocks/clocks.c
SRC_C += src/rp2_common/hardware_watchdog/watchdog.c
SRC_C += src/rp2_common/hardware_ticks/ticks.c

SRC_C += src/rp2_common/pico_bootrom/bootrom.c
SRC_C += src/rp2_common/pico_clib_interface/picolibc_interface.c
SRC_C += src/rp2_common/pico_platform_panic/panic.c
SRC_C += src/rp2_common/pico_runtime/runtime.c
SRC_C += src/rp2_common/pico_runtime_init/runtime_init.c
SRC_C += src/rp2_common/pico_runtime_init/runtime_init_clocks.c

SRC_ASM += src/rp2_common/pico_crt0/crt0.S
SRC_ASM += src/rp2_common/hardware_irq/irq_handler_chain.S

SRC_ASM += src/rp2040/boot_stage2/boot2_w25q080.S

SYSTEM_STARTUP_OBJ := $(BUILD_PATH)/$(MODULE_PATH)/src/rp2_common/pico_crt0/crt0.o
SYSTEM_BOOT_OBJ := $(BUILD_PATH)/$(MODULE_PATH)/src/rp2040/boot_stage2/boot2_w25q080.o

$(MODULE)_WEAK_SRC := src/rp2_common/pico_runtime_init/runtime_init.c

# ----------------------------------------------------------------------------
# Set up the module level include path

$(MODULE)_INCPATH :=

# ----------------------------------------------------------------------------
# NOTE: The default HAL config file must be created somehow - it is normally
#       up to the developer to specify which HAL elements are needed and how
#       they are to be configured.
#
# By convention we place config files in $(PRODUCT)/$(MCU) because
# that's an easy pace to leave things like HAL config, linker scripts etc

$(MODULE)_INCPATH += $(PRODUCT)/config/$(MCU)
$(MODULE)_INCPATH += $(cmsis_core_PATH)/Include
$(MODULE)_INCPATH += $(MCU_INCPATH)

# ---------------------------- ------------------------------------------------
# Set any module level compile time defaults here

$(MODULE)_CDEFS :=
$(MODULE)_CDEFS += $(MCU_CDEFS)


#    CDEFS += NDEBUG
#    CDEFS += LIB_PICO_PRINTF=1 LIB_PICO_PRINTF_PICO=1
#    CDEFS += PICO_BOARD=\"pico\" PICO_BUILD=1 PICO_CMAKE_BUILD_TYPE=\"Release\"
#    CDEFS += PICO_NO_FLASH=0
#    CDEFS += __ARM_ARCH_6M__
$(MODULE)_CDEFS += LIB_PICO_BIT_OPS=1 LIB_PICO_BIT_OPS_PICO=1
$(MODULE)_CDEFS += LIB_PICO_DIVIDER=1 LIB_PICO_DIVIDER_HARDWARE=1
$(MODULE)_CDEFS += LIB_PICO_DOUBLE=1 LIB_PICO_DOUBLE_PICO=1
$(MODULE)_CDEFS += LIB_PICO_FLOAT=1 LIB_PICO_FLOAT_PICO=1
$(MODULE)_CDEFS += LIB_PICO_INT64_OPS=1 LIB_PICO_INT64_OPS_PICO=1
$(MODULE)_CDEFS += LIB_PICO_MALLOC=1
$(MODULE)_CDEFS += LIB_PICO_MEM_OPS=1 LIB_PICO_MEM_OPS_PICO=1
$(MODULE)_CDEFS += LIB_PICO_PLATFORM=1
$(MODULE)_CDEFS += LIB_PICO_RUNTIME=1
$(MODULE)_CDEFS += LIB_PICO_STANDARD_LINK=1
# $(MODULE)_CDEFS += LIB_PICO_STDIO=1 LIB_PICO_STDIO_UART=1
$(MODULE)_CDEFS += LIB_PICO_STDLIB=1
$(MODULE)_CDEFS += LIB_PICO_SYNC=1 LIB_PICO_SYNC_CRITICAL_SECTION=1 LIB_PICO_SYNC_MUTEX=1 LIB_PICO_SYNC_SEM=1
$(MODULE)_CDEFS += LIB_PICO_TIME=1
$(MODULE)_CDEFS += LIB_PICO_UTIL=1
$(MODULE)_CDEFS += PICO_COPY_TO_RAM=0
$(MODULE)_CDEFS += PICO_CXX_ENABLE_EXCEPTIONS=0
$(MODULE)_CDEFS += PICO_NO_HARDWARE=0
$(MODULE)_CDEFS += PICO_ON_DEVICE=1
$(MODULE)_CDEFS += PICO_TARGET_NAME=\"helloworld\"
$(MODULE)_CDEFS += PICO_USE_BLOCKED_RAM=0
$(MODULE)_CDEFS += PICO_TIME_DEFAULT_ALARM_POOL_DISABLED
# $(MODULE)_CDEFS += PICO_BOARD=pico
# $(MODULE)_CDEFS += PICO_PLATFORM=rp2040
# $(MODULE)_CDEFS += PICO_RP2040
$(MODULE)_CDEFS += PICO_NO_FLASH=0
$(MODULE)_CDEFS += PICO_NO_RAM_VECTOR_TABLE=1
$(MODULE)_CDEFS += PICO_STDIO_SEMIHOSTING=1
$(MODULE)_CDEFS += PICO_C_COMPILER_IS_GNU=1
$(MODULE)_CDEFS += PICO_NO_FPGA_CHECK=1
$(MODULE)_CDEFS += LIB_PICO_PRINTF_NONE=1
$(MODULE)_CDEFS += PICO_RUNTIME_NO_INIT_PER_CORE_TLS_SETUP=1
$(MODULE)_CDEFS += PICO_RUNTIME_SKIP_INIT_PER_CORE_TLS_SETUP=1
$(MODULE)_CDEFS += LIB_CMSIS_CORE=1 
$(MODULE)_CDEFS += LIB_PICO_STDIO=0
$(MODULE)_CDEFS += PICO_CMSIS_RENAME_EXCEPTIONS=1
$(MODULE)_CDEFS += PICO_RUNTIME_NO_INIT_SPIN_LOCKS_RESET=1
$(MODULE)_CDEFS += PICO_RUNTIME_SKIP_INIT_SPIN_LOCKS_RESET=1

$(MODULE)_CFLAGS :=
$(MODULE)_CFLAGS +=

# ----------------------------------------------------------------------------
# Include the adaptabuild library makefile - must be done for each module!

include $(ADAPTABUILD_PATH)/make/library.mak

# ----------------------------------------------------------------------------
