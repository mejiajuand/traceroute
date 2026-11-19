CC=cc
WARNINGS=-Wall -Wextra -Wpedantic -Wshadow -Wconversion \
-Wsign-conversion -Wformat -Wformat=2 -Wstrict-prototypes \
-Wmissing-prototypes
CFLAGS=$(WARNINGS) -fno-omit-frame-pointer
SRC=src/main.c
DBG=bin/debug
REL=bin/release
BIN=traceroute

all: $(DBG) $(DBG)/$(BIN)

$(DBG):
	mkdir -p $(DBG)

$(DBG)/$(BIN): $(SRC)
	$(CC) -g3 -O0 $(CFLAGS) $(SRC) -o $(DBG)/$(BIN)

$(REL):
	mkdir -p $(REL)

release: $(REL) $(SRC)
	$(CC) -O2 $(CFLAGS) $(SRC) -o $(REL)/$(BIN)

run:
	./$(DBG)/$(BIN)

clean:
	rm -f $(DBG)/$(BIN) $(REL)/$(BIN)

.PHONY: all release run clean
