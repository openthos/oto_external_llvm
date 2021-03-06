LOCAL_PATH := $(call my-dir)

amdgpu_mc_desc_TBLGEN_TABLES60 := \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenMCCodeEmitter.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_mc_desc_SRC_FILES := \
  AMDGPUAsmBackend.cpp \
  AMDGPUELFObjectWriter.cpp \
  AMDGPUELFStreamer.cpp \
  AMDGPUHSAMetadataStreamer.cpp \
  AMDGPUMCAsmInfo.cpp \
  AMDGPUMCCodeEmitter.cpp \
  AMDGPUMCTargetDesc.cpp \
  AMDGPUTargetStreamer.cpp \
  R600MCCodeEmitter.cpp \
  SIMCCodeEmitter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS60)

LOCAL_MODULE := libLLVM60AMDGPUDesc
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(amdgpu_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..
TBLGEN_TABLES60 := $(amdgpu_mc_desc_TBLGEN_TABLES60)

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

LOCAL_MODULE := libLLVM60AMDGPUDesc

LOCAL_SRC_FILES := $(amdgpu_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..
TBLGEN_TABLES60 := $(amdgpu_mc_desc_TBLGEN_TABLES60)

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
