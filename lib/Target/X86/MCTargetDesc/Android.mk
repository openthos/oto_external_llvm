LOCAL_PATH := $(call my-dir)

x86_mc_desc_TBLGEN_TABLES60 := \
  X86GenRegisterInfo.inc \
  X86GenInstrInfo.inc \
  X86GenSubtargetInfo.inc

x86_mc_desc_SRC_FILES := \
  X86AsmBackend.cpp \
  X86MCTargetDesc.cpp \
  X86MCAsmInfo.cpp \
  X86MCCodeEmitter.cpp \
  X86MachObjectWriter.cpp \
  X86ELFObjectWriter.cpp \
  X86WinCOFFObjectWriter.cpp \
  X86WinCOFFStreamer.cpp \
  X86WinCOFFTargetStreamer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS60)

LOCAL_MODULE:= libLLVM60X86Desc
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(x86_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..
TBLGEN_TABLES60 := $(x86_mc_desc_TBLGEN_TABLES60)
TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS60)


LOCAL_MODULE:= libLLVM60X86Desc

LOCAL_SRC_FILES := $(x86_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..
TBLGEN_TABLES60 := $(x86_mc_desc_TBLGEN_TABLES60)
TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
