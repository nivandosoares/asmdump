CC ?= cc
CFLAGS ?= -O2 -g -std=c11
WARNINGS := -Wall -Wextra -Wpedantic
BUILD_DIR := build
TARGET := $(BUILD_DIR)/td2_port
SDL_CFLAGS := $(shell if command -v sdl2-config >/dev/null 2>&1; then sdl2-config --cflags; else pkg-config --cflags sdl2; fi)
SDL_LIBS := $(shell if command -v sdl2-config >/dev/null 2>&1; then sdl2-config --libs; else pkg-config --libs sdl2; fi)
CPPFLAGS := -Iinclude $(SDL_CFLAGS)
SRC := \
	main.c \
	platform_sdl.c \
	src/td2_io.c \
	src/td2_ppu.c \
	src/td2_runtime.c
OBJ := $(SRC:%.c=$(BUILD_DIR)/%.o)

.PHONY: all clean test

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $@ $(SDL_LIBS)

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) $(WARNINGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

test: $(TARGET)
	./test_regression.sh
