CXX := g++
CXXFLAGS := -std=c++17 -Wall -Itests -Isrc -Iinclude

SRC_DIR := src
TEST_DIR := tests
BUILD_DIR := build

SRC := $(wildcard $(SRC_DIR)/*.cpp)
OBJ := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRC))

# Test source contains Catch2's main entry point.
TEST_SRC := $(wildcard $(TEST_DIR)/*.cpp)
TEST_OBJ := $(patsubst $(TEST_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(TEST_SRC))
TEST_EXECUTABLE := $(BUILD_DIR)/test.out

.PHONY: all clean run test

all: test

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compile project source files.
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile test files.
$(BUILD_DIR)/%.o: $(TEST_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build and run the unit tests.
test: $(OBJ) $(TEST_OBJ)
	$(CXX) $(CXXFLAGS) $(OBJ) $(TEST_OBJ) -o $(TEST_EXECUTABLE)
	./$(TEST_EXECUTABLE)

run: test

clean:
	rm -rf $(BUILD_DIR)

