# Compiler
CC = kos-cc
AR = sh-elf-gcc-ar

CFLAGS = -Ipixman -DPIXMAN_NO_TLS=1 -I. -DPACKAGE=1 -DNDEBUG=1 -Wno-incompatible-pointer-types -Oz -Idc

#-DFORCE_ARGB1555=1

# Source directory
SRCDIR = ./pixman

# List of specific source files to compile
SRC_C = $(SRCDIR)/pixman-access-accessors.c \
        $(SRCDIR)/pixman-access.c \
        $(SRCDIR)/pixman-bits-image.c \
        $(SRCDIR)/pixman.c \
        $(SRCDIR)/pixman-combine32.c \
        $(SRCDIR)/pixman-combine-float.c \
        $(SRCDIR)/pixman-conical-gradient.c \
        $(SRCDIR)/pixman-edge-accessors.c \
        $(SRCDIR)/pixman-edge.c \
        $(SRCDIR)/pixman-fast-path.c \
        $(SRCDIR)/pixman-filter.c \
        $(SRCDIR)/pixman-general.c \
        $(SRCDIR)/pixman-glyph.c \
        $(SRCDIR)/pixman-gradient-walker.c \
        $(SRCDIR)/pixman-image.c \
        $(SRCDIR)/pixman-implementation.c \
        $(SRCDIR)/pixman-linear-gradient.c \
        $(SRCDIR)/pixman-matrix.c \
        $(SRCDIR)/pixman-noop.c \
        $(SRCDIR)/pixman-radial-gradient.c \
        $(SRCDIR)/pixman-region16.c \
        $(SRCDIR)/pixman-region32.c \
        $(SRCDIR)/pixman-solid-fill.c \
        $(SRCDIR)/pixman-trap.c \
        $(SRCDIR)/pixman-utils.c dc/mem_dc.c

# Create object files by replacing .c with .o
OBJ_C = $(SRC_C:.c=.o)

# Output executable name
TARGET = libpixman-1.a

# Default rule to build the target
all: $(TARGET)

# Rule to create the static library
$(TARGET): $(OBJ_C)
	$(AR) rcs $@ $^

# Rule to compile C files into object files
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Clean up build artifacts
clean:
	rm -f $(OBJ_C) $(TARGET)