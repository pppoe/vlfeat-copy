PWD:=$(shell pwd)

CXX:=$(shell which g++)
CC:=$(shell which gcc)

BIN_DIR:="./build"
all: 
	if [ ! -d $(BIN_DIR) ]; then mkdir -pv $(BIN_DIR); fi && if [ ! -f $(BIN_DIR)/Makefile ]; then cd $(BIN_DIR) && cmake $(PWD) && cd $(PWD); fi && cd $(BIN_DIR) && make
verbose: 
	if [ ! -d $(BIN_DIR) ]; then mkdir -pv $(BIN_DIR); fi && if [ ! -f $(BIN_DIR)/Makefile ]; then cd $(BIN_DIR) && cmake $(PWD) && cd $(PWD); fi && cd $(BIN_DIR) && make VERBOSE=1
