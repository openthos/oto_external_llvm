LOCAL_PATH := $(call my-dir)

arm_mc_desc_TBLGEN_TABLES60 := \
  ARMGenRegisterInfo.inc \
  ARMGenInstrInfo.inc \
  ARMGenMCCodeEmitter.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenSystemRegister.inc

arm_mc_desc_SRC_FILES := \
  ARMAsmBackend.cpp \
  ARMELFObjectWriter.cpp \
  ARMELFStreamer.cpp \
  ARMMachObjectWriter.cpp \
  ARMMachORelocationInfo.cpp \
  ARMMCAsmInfo.cpp \
  ARMMCCodeEmitter.cpp \
  ARMMCExpr.cpp \
  ARMMCTargetDesc.cpp \
  ARMTargetStreamer.cpp \
  ARMUnwindOpAsm.cpp \
  ARMWinCOFFObjectWriter.cpp \
  ARMWinCOFFStreamer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS60)


LOCAL_MODULE:= libLLVM60ARMDesc
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(arm_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..
TBLGEN_TABLES60 := $(arm_mc_desc_TBLGEN_TABLES60)

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS60)

LOCAL_MODULE:= libLLVM60ARMDesc
LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(arm_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..
TBLGEN_TABLES60 := $(arm_mc_desc_TBLGEN_TABLES60)

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
