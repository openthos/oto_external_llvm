LOCAL_PATH := $(call my-dir)

LLVM60_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM60_ROOT_PATH)/llvm.mk

llvm_symbolizer_SRC_FILES := \
  llvm-symbolizer.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-symbolizer
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_symbolizer_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := \
  libLLVM60Symbolize \
  libLLVM60DebugInfoDWARF \
  libLLVM60DebugInfoPDB \
  libLLVM60Object \
  libLLVM60BitReader \
  libLLVM60MC \
  libLLVM60MCParser \
  libLLVM60Core \
  libLLVM60Support

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
LOCAL_MODULE := llvm-symbolizer
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_symbolizer_SRC_FILES)
LOCAL_SHARED_LIBRARIES := libLLVM60

include $(LLVM60_DEVICE_BUILD_MK)
include $(BUILD_EXECUTABLE)
endif
