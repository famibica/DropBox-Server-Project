CC=gcc
SRC_DIR=./source/
INC_DIR=./include/
BIN_DIR=./bin/
S_DIR=./server/
C_DIR=./client/
FLAGS= -pthread -g -Wall -lssl -lcrypto

all: utilities server client

utilities: $(SRC_DIR)dropboxUtil.c
	$(CC) -I$(INC_DIR) -o $(BIN_DIR)dropboxUtil.o -c $(SRC_DIR)dropboxUtil.c $(FLAGS)

client: $(SRC_DIR)dropboxClient.c utilities
	$(CC) -o $(C_DIR)dropboxClient $(SRC_DIR)dropboxClient.c $(BIN_DIR)dropboxUtil.o $(FLAGS)

server: $(SRC_DIR)dropboxServer.c utilities
	$(CC) -o $(S_DIR)dropboxServer $(SRC_DIR)dropboxServer.c $(BIN_DIR)dropboxUtil.o $(FLAGS)

clean:
	rm -rf $(BIN_DIR)*.o $(S_DIR)dropboxServer $(C_DIR)dropboxClient
