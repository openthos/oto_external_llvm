# We treat Intrinsics.td as a very special target just like what lib/VMCore/Makefile does
INTRINSICTD60 := $(LLVM60_ROOT_PATH)/include/llvm/IR/Intrinsics.td
INTRINSICTD60S := $(wildcard $(dir $(INTRINSICTD60))/Intrinsics*.td)

ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,Intrinsics.gen)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD60) $(INTRINSICTD60S) | $(LLVM60_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out60,intrinsic)
else
	$(call transform-device-td-to-out60,intrinsic)
endif
