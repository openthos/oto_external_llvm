LOCAL_PATH := $(call my-dir)

arm_disassembler_TBLGEN_TABLES60 := \
  ARMGenDisassemblerTables.inc \
  ARMGenInstrInfo.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenRegisterInfo.inc \
  ARMGenSystemRegister.inc

arm_disassembler_SRC_FILES := \
  ARMDisassembler.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS60)

TBLGEN_TABLES60 := $(arm_disassembler_TBLGEN_TABLES60)

TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM60ARMDisassembler

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS60)

TBLGEN_TABLES60 := $(arm_disassembler_TBLGEN_TABLES60)

TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM60ARMDisassembler

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

