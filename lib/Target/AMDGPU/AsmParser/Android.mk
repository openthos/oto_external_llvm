LOCAL_PATH := $(call my-dir)

amdgpu_asm_parser_SRC_FILES := \
  AMDGPUAsmParser.cpp

amdgpu_asm_parser_TBLGEN_TABLES60 := \
  AMDGPUGenAsmMatcher.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_asm_parser_TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..

amdgpu_asm_parser_C_INCLUDES :=	$(LOCAL_PATH)/..

#===---------------------------------------------------------------===
# libAMDGPUAsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS60)

LOCAL_MODULE := libLLVM60AMDGPUAsmParser
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(amdgpu_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(amdgpu_asm_parser_C_INCLUDES)
TBLGEN_TABLES60 := $(amdgpu_asm_parser_TBLGEN_TABLES60)
TBLGEN_TD_DIR60 := $(amdgpu_asm_parser_TBLGEN_TD_DIR60)

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libAMDGPUAsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS60)

LOCAL_MODULE := libLLVM60AMDGPUAsmParser
LOCAL_SRC_FILES := $(amdgpu_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(amdgpu_asm_parser_C_INCLUDES)
TBLGEN_TABLES60 := $(amdgpu_asm_parser_TBLGEN_TABLES60)
TBLGEN_TD_DIR60 := $(amdgpu_asm_parser_TBLGEN_TD_DIR60)

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
