# Makefile — appstream
#
# Builds the shared library for the Dart FFI bridge.
# dart_api_dl.c is compiled as C; everything else as C++23.

CC      = gcc
CXX     = g++
CFLAGS  = -O2 -fPIC -I include
CXXFLAGS = -std=c++23 -O2 -fPIC -fvisibility=hidden -I include -Wall -Wextra
LDFLAGS  = -shared -pthread -lsqlite3

LIB_DIR = lib
TARGET  = $(LIB_DIR)/libappstream.so

# C source (must be compiled as C, not C++)
C_SRCS  = src/dart_api_dl.c
C_OBJS  = $(C_SRCS:.c=.o)

# C++23 sources
CXX_SRCS = src/appstream_ffi.cpp \
           src/AppStreamParser.cpp \
           src/Component.cpp \
           src/XmlScanner.cpp \
           src/SqliteWriter.cpp \
           src/StringPool.cpp
CXX_OBJS = $(CXX_SRCS:.cpp=.o)

ALL_OBJS = $(C_OBJS) $(CXX_OBJS)

.PHONY: all clean verify

all: $(TARGET)

$(TARGET): $(ALL_OBJS) | $(LIB_DIR)
	$(CXX) $(ALL_OBJS) $(LDFLAGS) -o $@
	@echo "Built $@ ($$(wc -c < "$@") bytes)"

$(LIB_DIR):
	mkdir -p $(LIB_DIR)

# C compilation
src/dart_api_dl.o: src/dart_api_dl.c include/dart_api_dl.h include/dart_api_types.h
	$(CC) $(CFLAGS) -c $< -o $@

# C++ compilation
src/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

verify: $(TARGET)
	@echo "=== Exported symbols ==="
	nm -D --defined-only $(TARGET) | grep ' T '
	@echo ""
	@echo "=== ELF sections ==="
	size $(TARGET)

clean:
	rm -f $(ALL_OBJS) $(TARGET)
