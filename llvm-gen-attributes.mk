ATTRIBUTETD60 := $(LLVM60_ROOT_PATH)/include/llvm/IR/Attributes.td

ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,Attributes.gen)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(ATTRIBUTETD60) | $(LLVM60_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out60,attrs)
else
	$(call transform-device-td-to-out60,attrs)
endif
