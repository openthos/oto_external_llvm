LOCAL_PATH:= $(call my-dir)

transforms_ipo_SRC_FILES := \
  AlwaysInliner.cpp \
  ArgumentPromotion.cpp \
  BarrierNoopPass.cpp \
  CalledValuePropagation.cpp \
  ConstantMerge.cpp \
  CrossDSOCFI.cpp \
  DeadArgumentElimination.cpp \
  ElimAvailExtern.cpp \
  ExtractGV.cpp \
  ForceFunctionAttrs.cpp \
  FunctionAttrs.cpp \
  FunctionImport.cpp \
  GlobalDCE.cpp \
  GlobalOpt.cpp \
  GlobalSplit.cpp \
  IPConstantPropagation.cpp \
  IPO.cpp \
  InferFunctionAttrs.cpp \
  InlineSimple.cpp \
  Inliner.cpp \
  Internalize.cpp \
  LoopExtractor.cpp \
  LowerTypeTests.cpp \
  MergeFunctions.cpp \
  PartialInlining.cpp \
  PassManagerBuilder.cpp \
  PruneEH.cpp \
  SampleProfile.cpp \
  StripDeadPrototypes.cpp \
  StripSymbols.cpp \
  ThinLTOBitcodeWriter.cpp \
  WholeProgramDevirt.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_ipo_SRC_FILES)
LOCAL_MODULE:= libLLVM60ipo

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_ipo_SRC_FILES)
LOCAL_MODULE:= libLLVM60ipo

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
