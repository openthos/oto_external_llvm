LOCAL_PATH:= $(call my-dir)

debuginfo_codeview_SRC_FILES := \
  AppendingTypeTableBuilder.cpp \
  CodeViewError.cpp \
  CodeViewRecordIO.cpp \
  ContinuationRecordBuilder.cpp \
  CVSymbolVisitor.cpp \
  CVTypeVisitor.cpp \
  DebugChecksumsSubsection.cpp \
  DebugCrossExSubsection.cpp \
  DebugCrossImpSubsection.cpp \
  DebugFrameDataSubsection.cpp \
  DebugInlineeLinesSubsection.cpp \
  DebugLinesSubsection.cpp \
  DebugStringTableSubsection.cpp \
  DebugSubsection.cpp \
  DebugSubsectionRecord.cpp \
  DebugSubsectionVisitor.cpp \
  DebugSymbolRVASubsection.cpp \
  DebugSymbolsSubsection.cpp \
  EnumTables.cpp \
  Formatters.cpp \
  GlobalTypeTableBuilder.cpp \
  LazyRandomTypeCollection.cpp \
  Line.cpp \
  MergingTypeTableBuilder.cpp \
  RecordName.cpp \
  RecordSerialization.cpp \
  SimpleTypeSerializer.cpp \
  StringsAndChecksums.cpp \
  SymbolRecordMapping.cpp \
  SymbolDumper.cpp \
  SymbolSerializer.cpp \
  TypeDumpVisitor.cpp \
  TypeIndex.cpp \
  TypeIndexDiscovery.cpp \
  TypeHashing.cpp \
  TypeRecordMapping.cpp \
  TypeStreamMerger.cpp \
  TypeTableCollection.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_codeview_SRC_FILES)

LOCAL_MODULE:= libLLVM60DebugInfoCodeView

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_codeview_SRC_FILES)

LOCAL_MODULE:= libLLVM60DebugInfoCodeView

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
