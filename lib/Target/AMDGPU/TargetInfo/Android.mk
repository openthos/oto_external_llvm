LOCAL_PATH := $(call my-dir)

amdgpu_target_info_TBLGEN_TABLES60 := \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenIntrinsics.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_target_info_SRC_FILES := \
  AMDGPUTargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS60)

LOCAL_MODULE := libLLVM60AMDGPUInfo
LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TABLES60 := $(amdgpu_target_info_TBLGEN_TABLES60)
TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(amdgpu_target_info_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS60)

LOCAL_MODULE := libLLVM60AMDGPUInfo

TBLGEN_TABLES60 := $(amdgpu_target_info_TBLGEN_TABLES60)
TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(amdgpu_target_info_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
