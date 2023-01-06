## -*- makefile -*-
##

SUBDIRS=	doc examples man src contrib share
EXTRA_DIST=	ChangeLog COPYING INSTALL LICENSE.TXT README.md NEWS AUTHORS \
	autogen.sh wave_locale.h tcl.m4 changes_from_gtk2.txt

# MacOS Universal build
# Pass x86_64 in compiler and linker flags if asked
if CLANG_ARCH_X86_64
CPPFLAGS += -arch x86_64
CFLAGS += -arch x86_64
CXXFLAGS += -arch x86_64
LDFLAGS += -arch x86_64
endif

# Pass arm64 in compiler and linker flags if asked
# (Note - may be additive to the above)
if CLANG_ARCH_ARM64
CPPFLAGS += -arch arm64
CFLAGS += -arch arm64
CXXFLAGS += -arch arm64
LDFLAGS += -arch arm64
endif
# END: MacOS Universal build
