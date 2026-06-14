# Makefile for HarryJSON Project

# Compiler
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++11 -I./inc

# Directories
SRC_DIR = src
APP_DIR = app
INC_DIR = inc
OBJ_DIR = obj
BIN_DIR = bin

# Source files
SOURCES = $(SRC_DIR)/JsonObject.cpp $(SRC_DIR)/JsonParse.cpp $(APP_DIR)/main.cpp
OBJECTS = $(OBJ_DIR)/JsonObject.o $(OBJ_DIR)/JsonParse.o $(OBJ_DIR)/main.o
EXECUTABLE = $(BIN_DIR)/app

# Phony targets
.PHONY: all clean run

# Default target
all: $(EXECUTABLE)

# Link the executable
$(EXECUTABLE): $(OBJECTS) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files to object files
$(OBJ_DIR)/JsonObject.o: $(SRC_DIR)/JsonObject.cpp $(INC_DIR)/JsonObject.hpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/JsonParse.o: $(SRC_DIR)/JsonParse.cpp $(INC_DIR)/JsonParse.hpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/main.o: $(APP_DIR)/main.cpp $(INC_DIR)/JsonParse.hpp $(INC_DIR)/JsonObject.hpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create directories if they don't exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Clean object files and executable
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

# Run the executable
run: $(EXECUTABLE)
	./$(EXECUTABLE)

# Help target
help:
	@echo "Available targets:"
	@echo "  make all   - Build the project (default)"
	@echo "  make clean - Remove build artifacts"
	@echo "  make run   - Build and run the executable"
	@echo "  make help  - Show this help message"
