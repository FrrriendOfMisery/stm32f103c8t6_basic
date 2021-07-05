
SOURCE_PATH = ./src/
INCLUDE_PATH = ./inc/
BIN_PATH = ./bin/


CC = arm-none-eabi-gcc
CXX = arm-none-eabi-g++

DEBUG_FLAGS = -Wall -O0 -ggdb
RELEASE_FLAGS = -O3
CC_FLAGS = -Wl,--gc-sections -nostartfiles -nodefaultlibs -nostdlib -mcpu=cortex-m3 -mthumb -static -I$(INCLUDE_PATH)
BUILD_FLAGS = -Tlinker.ld

OBJ_MODULES = $(SOURCE_PATH)*.o

%.o: %.c %.h
	$(CC) $(DEBUG_FLAGS) $(CC_FLAGS) -c $< -o $@

build.elf:
	$(CC) $(DEBUG_FLAGS) $(BUILD_FLAGS) $^.o $(BIN_PATH)$@

clean:
	rm -f $(SOURCE_PATH)*.o | rm -f $(BIN_PATH)build.elf