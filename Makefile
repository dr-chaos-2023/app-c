CC=gcc
CFLAGS=-std=c99 -Wall -pedantic -O3 -I.
BUILD_DIR=./build
APP_NAME=app
SOURCES := $(shell powershell -File ./get_files.ps1)
OBJECTS := $(patsubst %.c,$(BUILD_DIR)/%.o,$(SOURCES))

all: clean compile link run

compile: $(OBJECTS)

link: $(BUILD_DIR)/$(APP_NAME)

run: $(BUILD_DIR)/$(APP_NAME)
	clear && $<

$(BUILD_DIR)/$(APP_NAME): $(OBJECTS)
	$(CC) -o $@ $^ $(CFLAGS)

$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	mkdir -p $(dir $@)
	$(CC) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)