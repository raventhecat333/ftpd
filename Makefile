.PHONY: all all-classic format clean
.PHONY: 3dslink 3dslink-classic
.PHONY: 3dsx cia linux
.PHONY: 3dsx-classic cia-classic 
.PHONY: release release-nds release-3dsx release-cia 
.PHONY: release-3dsx-classic release-cia-classic

export GITREV  := $(shell git rev-parse HEAD 2>/dev/null | cut -c1-6)
export VERSION_MAJOR := 3
export VERSION_MINOR := 1
export VERSION_MICRO := 0
export VERSION := $(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_MICRO)

###########################################################################
all: 3dsx linux

all-classic: 3dsx-classic linux

format:
	@clang-format -style=file -i $(filter-out \
		include/imgui.h \
		source/imgui/imgui.cpp \
		source/imgui/imgui_demo.cpp \
		source/imgui/imgui_draw.cpp \
		source/imgui/imgui_internal.h \
		source/imgui/imgui_internal.h, \
		source/imgui/imgui_tables.cpp \
		source/imgui/imgui_widgets.cpp \
		source/imgui/imstb_rectpack.h \
		source/imgui/imstb_textedit.h \
		source/imgui/imstb_truetype.h \
		source/linux/KHR/khrplatform.h \
		source/linux/glad.c \
		source/linux/glad/glad.h \
		source/linux/imgui_impl_glfw.cpp \
		source/linux/imgui_impl_glfw.h \
		source/linux/imgui_impl_opengl3.cpp \
		source/linux/imgui_impl_opengl3.h \
		$(shell find source include -type f -name \*.c -o -name \*.cpp -o -name \*.h))

clean:
	@$(MAKE) -f Makefile.3ds clean
	@$(MAKE) -f Makefile.3ds clean CLASSIC="-DCLASSIC"
	@$(MAKE) -f Makefile.linux clean
	@$(RM) ftpd*.3dsx.xz ftpd*.cia.xz

###########################################################################
3dslink:
	@$(MAKE) -f Makefile.3ds 3dslink

3dslink-classic:
	@$(MAKE) -f Makefile.3ds 3dslink CLASSIC="-DCLASSIC"
###########################################################################
3dsx:
	@$(MAKE) -f Makefile.3ds 3dsx

3dsx-classic:
	@$(MAKE) -f Makefile.3ds 3dsx CLASSIC="-DCLASSIC"

cia: 3dsx
	@$(MAKE) -f Makefile.3ds cia

cia-classic: 3dsx-classic
	@$(MAKE) -f Makefile.3ds cia CLASSIC="-DCLASSIC"

nro:
	@$(MAKE) -f Makefile.switch all

nro-classic:
	@$(MAKE) -f Makefile.switch all CLASSIC="-DCLASSIC"

linux:
	@$(MAKE) -f Makefile.linux

###########################################################################
release-3dsx:
	@$(MAKE) -f Makefile.3ds 3dsx DEFINES=-DNDEBUG OPTIMIZE="-O3 -flto"

release-3dsx-classic:
	@$(MAKE) -f Makefile.3ds 3dsx DEFINES=-DNDEBUG OPTIMIZE="-O3 -flto" CLASSIC="-DCLASSIC"

release-cia: release-3dsx
	@$(MAKE) -f Makefile.3ds cia DEFINES=-DNDEBUG OPTIMIZE="-O3 -flto"

release-cia-classic: release-3dsx-classic
	@$(MAKE) -f Makefile.3ds cia DEFINES=-DNDEBUG OPTIMIZE="-O3 -flto" CLASSIC="-DCLASSIC"
