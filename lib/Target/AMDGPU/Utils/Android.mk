LOCAL_PATH := $(call my-dir)

amdgpu_utils_TBLGEN_TABLES60 := \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc \
  AMDGPUGenInstrInfo.inc

amdgpu_utils_SRC_FILES := \
  AMDGPUBaseInfo.cpp \
  AMDKernelCodeTUtils.cpp \
  AMDGPUAsmUtils.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(amdgpu_utils_SRC_FILES)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_MODULE := libLLVM60AMDGPUUtils

LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..
TBLGEN_TABLES60 := $(amdgpu_utils_TBLGEN_TABLES60)

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(amdgpu_utils_SRC_FILES)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_MODULE := libLLVM60AMDGPUUtils

TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..
TBLGEN_TABLES60 := $(amdgpu_utils_TBLGEN_TABLES60)

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
