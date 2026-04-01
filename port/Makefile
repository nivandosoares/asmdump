CC ?= cc
CFLAGS ?= -O2 -g -std=c11
WARNINGS := -Wall -Wextra -Wpedantic
BUILD_DIR := build
TARGET := $(BUILD_DIR)/td2_port
CALLBACK_MODEL_SMOKE := $(BUILD_DIR)/td2_callback_model_smoke
SCHEDULER_SMOKE := $(BUILD_DIR)/td2_scheduler_smoke
INPUT_MUTATION_SMOKE := $(BUILD_DIR)/td2_input_mutation_smoke
LIVE_INPUT_SMOKE := $(BUILD_DIR)/td2_live_input_smoke
SDL_CFLAGS := $(shell if command -v sdl2-config >/dev/null 2>&1; then sdl2-config --cflags; else pkg-config --cflags sdl2; fi)
SDL_LIBS := $(shell if command -v sdl2-config >/dev/null 2>&1; then sdl2-config --libs; else pkg-config --libs sdl2; fi)
CPPFLAGS := -Iinclude $(SDL_CFLAGS)
DEPFLAGS := -MMD -MP
LDLIBS := $(SDL_LIBS) -lm
SRC := \
	main.c \
	platform_sdl.c \
	src/td2_callback_model.c \
	src/td2_compare.c \
	src/td2_contracts.c \
	src/td2_input.c \
	src/td2_io.c \
	src/td2_ppu.c \
	src/td2_scheduler.c \
	src/td2_runtime.c
OBJ := $(SRC:%.c=$(BUILD_DIR)/%.o)
CALLBACK_MODEL_SMOKE_SRC := \
	test_callback_model.c \
	src/td2_callback_model.c \
	src/td2_contracts.c
CALLBACK_MODEL_SMOKE_OBJ := $(CALLBACK_MODEL_SMOKE_SRC:%.c=$(BUILD_DIR)/%.o)
SCHEDULER_SMOKE_SRC := \
	test_scheduler.c \
	src/td2_callback_model.c \
	src/td2_compare.c \
	src/td2_contracts.c \
	src/td2_input.c \
	src/td2_io.c \
	src/td2_ppu.c \
	src/td2_scheduler.c \
	src/td2_runtime.c
SCHEDULER_SMOKE_OBJ := $(SCHEDULER_SMOKE_SRC:%.c=$(BUILD_DIR)/%.o)
INPUT_MUTATION_SMOKE_SRC := \
	test_input_mutation.c \
	src/td2_callback_model.c \
	src/td2_compare.c \
	src/td2_contracts.c \
	src/td2_input.c \
	src/td2_io.c \
	src/td2_ppu.c \
	src/td2_scheduler.c \
	src/td2_runtime.c
INPUT_MUTATION_SMOKE_OBJ := $(INPUT_MUTATION_SMOKE_SRC:%.c=$(BUILD_DIR)/%.o)
LIVE_INPUT_SMOKE_SRC := \
	test_live_input.c \
	platform_sdl.c \
	src/td2_callback_model.c \
	src/td2_compare.c \
	src/td2_contracts.c \
	src/td2_input.c \
	src/td2_io.c \
	src/td2_ppu.c \
	src/td2_scheduler.c \
	src/td2_runtime.c
LIVE_INPUT_SMOKE_OBJ := $(LIVE_INPUT_SMOKE_SRC:%.c=$(BUILD_DIR)/%.o)
ALL_OBJ := $(sort $(OBJ) $(CALLBACK_MODEL_SMOKE_OBJ) $(SCHEDULER_SMOKE_OBJ) $(INPUT_MUTATION_SMOKE_OBJ) $(LIVE_INPUT_SMOKE_OBJ))
DEPS := $(ALL_OBJ:.o=.d)

.PHONY: all clean test

all: $(TARGET) $(CALLBACK_MODEL_SMOKE) $(SCHEDULER_SMOKE) $(INPUT_MUTATION_SMOKE) $(LIVE_INPUT_SMOKE)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $@ $(LDLIBS)

$(CALLBACK_MODEL_SMOKE): $(CALLBACK_MODEL_SMOKE_OBJ)
	$(CC) $(CALLBACK_MODEL_SMOKE_OBJ) -o $@ $(LDLIBS)

$(SCHEDULER_SMOKE): $(SCHEDULER_SMOKE_OBJ)
	$(CC) $(SCHEDULER_SMOKE_OBJ) -o $@ $(LDLIBS)

$(INPUT_MUTATION_SMOKE): $(INPUT_MUTATION_SMOKE_OBJ)
	$(CC) $(INPUT_MUTATION_SMOKE_OBJ) -o $@ $(LDLIBS)

$(LIVE_INPUT_SMOKE): $(LIVE_INPUT_SMOKE_OBJ)
	$(CC) $(LIVE_INPUT_SMOKE_OBJ) -o $@ $(LDLIBS)

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) $(WARNINGS) $(DEPFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

test: $(TARGET) $(CALLBACK_MODEL_SMOKE) $(SCHEDULER_SMOKE) $(INPUT_MUTATION_SMOKE) $(LIVE_INPUT_SMOKE)
	./test_regression.sh
	./test_compare_lane.sh
	./test_callback_model.sh
	./test_scheduler.sh
	./test_input_mutation.sh
	./test_live_input.sh

-include $(DEPS)
