###########################################################
## Commands for running tblgen to compile a td file
##########################################################
define transform-td-to-out60
$(if $(LOCAL_IS_HOST_MODULE),	\
	$(call transform-host-td-to-out60,$(1)),	\
	$(call transform-device-td-to-out60,$(1)))
endef

###########################################################
## TableGen: Compile .td files to .inc.
###########################################################

# Set LOCAL_MODULE_CLASS to STATIC_LIBRARIES default (require
# for macro local-generated-sources-dir)
ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

ifneq ($(strip $(TBLGEN_TABLES60)),)

generated_sources := $(call local-generated-sources-dir)
tblgen_gen_tables := $(addprefix $(generated_sources)/,$(TBLGEN_TABLES60))
LOCAL_GENERATED_SOURCES += $(tblgen_gen_tables)

tblgen_source_dir := $(LOCAL_PATH)
ifneq ($(TBLGEN_TD_DIR60),)
tblgen_source_dir := $(TBLGEN_TD_DIR60)
endif

ifneq (,$(filter $(tblgen_source_dir),MCTargetDesc))
tblgen_td_deps := $(tblgen_source_dir)/../*.td
else
tblgen_td_deps := $(tblgen_source_dir)/*.td
endif
tblgen_td_deps := $(wildcard $(tblgen_td_deps))

#
# The directory and the .td directory is not the same.
#
ifeq ($(tblgen_source_dir),$(LLVM60_ROOT_PATH)/lib/Target/ARM/MCTargetDesc)
$(generated_sources)/%GenRegisterInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterInfo.inc: $(tblgen_source_dir)/../%.td \
                                       $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60, register-info)

$(generated_sources)/%GenInstrInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenInstrInfo.inc: $(tblgen_source_dir)/../%.td \
                                    $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,instr-info)

$(generated_sources)/%GenSubtargetInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSubtargetInfo.inc: $(tblgen_source_dir)/../%.td \
                                        $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,subtarget)
endif

ifeq ($(tblgen_source_dir),$(LLVM60_ROOT_PATH)/lib/Target/X86/MCTargetDesc)
$(generated_sources)/%GenRegisterInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterInfo.inc: $(tblgen_source_dir)/../%.td \
                                       $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60, register-info)

$(generated_sources)/%GenInstrInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenInstrInfo.inc: $(tblgen_source_dir)/../%.td \
                                    $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,instr-info)

$(generated_sources)/%GenSubtargetInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSubtargetInfo.inc: $(tblgen_source_dir)/../%.td \
                                        $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,subtarget)
endif

ifeq ($(tblgen_source_dir),$(LLVM60_ROOT_PATH)/lib/Target/Mips/MCTargetDesc)
$(generated_sources)/%GenRegisterInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterInfo.inc: $(tblgen_source_dir)/../%.td \
                                       $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60, register-info)

$(generated_sources)/%GenInstrInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenInstrInfo.inc: $(tblgen_source_dir)/../%.td \
                                    $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,instr-info)

$(generated_sources)/%GenSubtargetInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSubtargetInfo.inc: $(tblgen_source_dir)/../%.td \
                                        $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,subtarget)
endif

ifneq ($(filter %GenRegisterInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenRegisterInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterInfo.inc: $(tblgen_source_dir)/%.td \
                                       $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,register-info)
endif

ifneq ($(filter %GenInstrInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenInstrInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenInstrInfo.inc: $(tblgen_source_dir)/%.td \
                                    $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,instr-info)
endif

ifneq ($(filter %GenAsmWriter.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenAsmWriter.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenAsmWriter.inc: $(tblgen_source_dir)/%.td \
                                    $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,asm-writer)
endif

ifneq ($(filter %GenAsmWriter1.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenAsmWriter1.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenAsmWriter1.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,asm-writer -asmwriternum=1)
endif

ifneq ($(filter %GenAsmMatcher.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenAsmMatcher.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenAsmMatcher.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,asm-matcher)
endif

# TODO(srhines): Is this needed
ifneq ($(filter %GenCodeEmitter.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenCodeEmitter.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenCodeEmitter.inc: $(tblgen_source_dir)/%.td \
                                      $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,emitter)
endif

ifneq ($(filter %GenMCCodeEmitter.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenMCCodeEmitter.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenMCCodeEmitter.inc: $(tblgen_source_dir)/%.td \
                                        $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,emitter)
endif

ifneq ($(filter %GenMCPseudoLowering.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenMCPseudoLowering.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenMCPseudoLowering.inc: $(tblgen_source_dir)/%.td \
                                           $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,pseudo-lowering)
endif

ifneq ($(filter %GenDAGISel.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenDAGISel.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenDAGISel.inc: $(tblgen_source_dir)/%.td \
                                  $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,dag-isel)
endif

ifneq ($(filter %GenRegisterBank.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenRegisterBank.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterBank.inc: $(tblgen_source_dir)/%.td \
                                  $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,register-bank)
endif

ifneq ($(filter %GenDisassemblerTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenDisassemblerTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenDisassemblerTables.inc: $(tblgen_source_dir)/%.td \
                                             $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,disassembler)
endif

ifneq ($(filter %GenEDInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenEDInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenEDInfo.inc: $(tblgen_source_dir)/%.td \
                                 $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,enhanced-disassembly-info)
endif

ifneq ($(filter %GenFastISel.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenFastISel.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenFastISel.inc: $(tblgen_source_dir)/%.td \
                                   $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,fast-isel)
endif

ifneq ($(filter %GenGlobalISel.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenGlobalISel.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenGlobalISel.inc: $(tblgen_source_dir)/%.td \
                                   $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,global-isel)
endif

ifneq ($(filter %GenSubtargetInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenSubtargetInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSubtargetInfo.inc: $(tblgen_source_dir)/%.td \
                                        $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,subtarget)
endif

ifneq ($(filter %GenCallingConv.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenCallingConv.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenCallingConv.inc: $(tblgen_source_dir)/%.td \
                                      $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,callingconv)
endif

ifneq ($(filter %GenIntrinsics.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenIntrinsics.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenIntrinsics.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,tgt-intrinsic)
endif

ifneq ($(filter %GenSystemOperands.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenSystemOperands.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSystemOperands.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,searchable-tables)
endif

ifneq ($(filter %GenDFAPacketizer.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenDFAPacketizer.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenDFAPacketizer.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) | $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,dfa-packetizer)
endif

ifneq ($(findstring ARMGenDecoderTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/ARMGenDecoderTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/ARMGenDecoderTables.inc: $(tblgen_source_dir)/ARM.td \
                                          $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,arm-decoder)
endif

ifneq ($(findstring ARMGenSystemRegister.inc,$(tblgen_gen_tables)),)
$(generated_sources)/ARMGenSystemRegister.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/ARMGenSystemRegister.inc: $(tblgen_source_dir)/ARM.td \
                                          $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,searchable-tables)
endif

ifneq ($(findstring Options.inc,$(tblgen_gen_tables)),)
$(generated_sources)/Options.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/Options.inc: $(tblgen_source_dir)/Options.td \
                                     $(tblgen_td_deps) \
                                     $(LLVM60_TBLGEN) \
                                     $(LLVM60_ROOT_PATH)/include/llvm/Option/OptParser.td
	$(call transform-td-to-out60,opt-parser-defs)
endif

ifneq ($(findstring X86GenEVEX2VEXTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/X86GenEVEX2VEXTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/X86GenEVEX2VEXTables.inc: $(tblgen_source_dir)/X86.td \
                                          $(tblgen_td_deps) $(LLVM60_TBLGEN)
	$(call transform-td-to-out60,x86-EVEX2VEX-tables)
endif

# Reset local variables
tblgen_td_deps :=

endif
