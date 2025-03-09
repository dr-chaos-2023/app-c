CC = gcc
CFLAGS = -std=c99 -Wall -pedantic -O3 -I.
BUILD_DIR = ./build
APP_NAME = app
SOURCES := $(shell ./get_files.sh)
OBJECTS := $(SOURCES:%.c=$(BUILD_DIR)/%.o)

all: $(BUILD_DIR)/$(APP_NAME)

$(BUILD_DIR)/$(APP_NAME): $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

run: all
	clear && $(BUILD_DIR)/$(APP_NAME)

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all run clean