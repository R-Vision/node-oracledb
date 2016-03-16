# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := oracledb
DEFS_Debug := \
	'-DNODE_GYP_MODULE_NAME=oracledb' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION' \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-fexceptions \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x \
	-fexceptions

INCS_Debug := \
	-I/root/.node-gyp/4.4.0/include/node \
	-I/root/.node-gyp/4.4.0/src \
	-I/root/.node-gyp/4.4.0/deps/uv/include \
	-I/root/.node-gyp/4.4.0/deps/v8/include \
	-I/opt/collectorjs/instantclient/sdk/include \
	-I$(srcdir)/src/dpi/src \
	-I$(srcdir)/src/dpi/include \
	-I$(srcdir)/node_modules/nan

DEFS_Release := \
	'-DNODE_GYP_MODULE_NAME=oracledb' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-fexceptions \
	-O3 \
	-ffunction-sections \
	-fdata-sections \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x \
	-fexceptions

INCS_Release := \
	-I/root/.node-gyp/4.4.0/include/node \
	-I/root/.node-gyp/4.4.0/src \
	-I/root/.node-gyp/4.4.0/deps/uv/include \
	-I/root/.node-gyp/4.4.0/deps/v8/include \
	-I/opt/collectorjs/instantclient/sdk/include \
	-I$(srcdir)/src/dpi/src \
	-I$(srcdir)/src/dpi/include \
	-I$(srcdir)/node_modules/nan

OBJS := \
	$(obj).target/$(TARGET)/src/njs/src/njsOracle.o \
	$(obj).target/$(TARGET)/src/njs/src/njsPool.o \
	$(obj).target/$(TARGET)/src/njs/src/njsConnection.o \
	$(obj).target/$(TARGET)/src/njs/src/njsResultSet.o \
	$(obj).target/$(TARGET)/src/njs/src/njsMessages.o \
	$(obj).target/$(TARGET)/src/njs/src/njsIntLob.o \
	$(obj).target/$(TARGET)/src/dpi/src/dpiEnv.o \
	$(obj).target/$(TARGET)/src/dpi/src/dpiEnvImpl.o \
	$(obj).target/$(TARGET)/src/dpi/src/dpiException.o \
	$(obj).target/$(TARGET)/src/dpi/src/dpiExceptionImpl.o \
	$(obj).target/$(TARGET)/src/dpi/src/dpiConnImpl.o \
	$(obj).target/$(TARGET)/src/dpi/src/dpiDateTimeArrayImpl.o \
	$(obj).target/$(TARGET)/src/dpi/src/dpiPoolImpl.o \
	$(obj).target/$(TARGET)/src/dpi/src/dpiStmtImpl.o \
	$(obj).target/$(TARGET)/src/dpi/src/dpiUtils.o \
	$(obj).target/$(TARGET)/src/dpi/src/dpiLob.o \
	$(obj).target/$(TARGET)/src/dpi/src/dpiCommon.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64

LIBS := \
	-lclntsh \
	-L/opt/collectorjs/instantclient 

$(obj).target/oracledb.node: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/oracledb.node: LIBS := $(LIBS)
$(obj).target/oracledb.node: TOOLSET := $(TOOLSET)
$(obj).target/oracledb.node: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,solink_module)

all_deps += $(obj).target/oracledb.node
# Add target alias
.PHONY: oracledb
oracledb: $(builddir)/oracledb.node

# Copy this to the executable output path.
$(builddir)/oracledb.node: TOOLSET := $(TOOLSET)
$(builddir)/oracledb.node: $(obj).target/oracledb.node FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/oracledb.node
# Short alias for building this executable.
.PHONY: oracledb.node
oracledb.node: $(obj).target/oracledb.node $(builddir)/oracledb.node

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/oracledb.node

