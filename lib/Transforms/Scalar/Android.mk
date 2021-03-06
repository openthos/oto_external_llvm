LOCAL_PATH:= $(call my-dir)

transforms_scalar_SRC_FILES := \
  ADCE.cpp \
  AlignmentFromAssumptions.cpp \
  BDCE.cpp \
  CallSiteSplitting.cpp \
  ConstantHoisting.cpp \
  ConstantProp.cpp \
  CorrelatedValuePropagation.cpp \
  DCE.cpp \
  DeadStoreElimination.cpp \
  DivRemPairs.cpp \
  EarlyCSE.cpp \
  FlattenCFGPass.cpp \
  Float2Int.cpp \
  GuardWidening.cpp \
  GVN.cpp \
  GVNHoist.cpp \
  GVNSink.cpp \
  IVUsersPrinter.cpp \
  InductiveRangeCheckElimination.cpp \
  IndVarSimplify.cpp \
  InferAddressSpaces.cpp \
  JumpThreading.cpp \
  LICM.cpp \
  LoopAccessAnalysisPrinter.cpp \
  LoopSink.cpp \
  LoopDeletion.cpp \
  LoopDataPrefetch.cpp \
  LoopDistribute.cpp \
  LoopIdiomRecognize.cpp \
  LoopInstSimplify.cpp \
  LoopInterchange.cpp \
  LoopLoadElimination.cpp \
  LoopPassManager.cpp \
  LoopPredication.cpp \
  LoopRerollPass.cpp \
  LoopRotation.cpp \
  LoopSimplifyCFG.cpp \
  LoopStrengthReduce.cpp \
  LoopUnrollPass.cpp \
  LoopUnswitch.cpp \
  LoopVersioningLICM.cpp \
  LowerAtomic.cpp \
  LowerExpectIntrinsic.cpp \
  LowerGuardIntrinsic.cpp \
  MemCpyOptimizer.cpp \
  MergeICmps.cpp \
  MergedLoadStoreMotion.cpp \
  NaryReassociate.cpp \
  NewGVN.cpp \
  PartiallyInlineLibCalls.cpp \
  PlaceSafepoints.cpp \
  Reassociate.cpp \
  Reg2Mem.cpp \
  RewriteStatepointsForGC.cpp \
  SCCP.cpp \
  SROA.cpp \
  Scalar.cpp \
  Scalarizer.cpp \
  SeparateConstOffsetFromGEP.cpp \
  SimpleLoopUnswitch.cpp \
  SimplifyCFGPass.cpp \
  Sink.cpp \
  SpeculativeExecution.cpp \
  SpeculateAroundPHIs.cpp \
  StraightLineStrengthReduce.cpp \
  StructurizeCFG.cpp \
  TailRecursionElimination.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES :=	\
	$(transforms_scalar_SRC_FILES)

LOCAL_MODULE:= libLLVM60ScalarOpts

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_scalar_SRC_FILES)
LOCAL_MODULE:= libLLVM60ScalarOpts

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
