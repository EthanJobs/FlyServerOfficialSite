CC = cc

SOURCE_DIR = ./src/
BUILD_DIR = ./build/

LIB_FLAG = -L lib/ -lFlyServer -lFlyUtil -lpthread -lmysqlclient
INCLUDE_FLAG = -I./include/util -I./include/server

SOURCE_FILES = $(shell find $(SOURCE_DIR) -type f)
SO_FILES = $(patsubst $(SOURCE_DIR)%.c, %.so, $(SOURCE_FILES))

vpath %.a lib
vpath %.so build
vpath %.c src

ALL: rsync_dir $(SO_FILES)

$(SO_FILES):%.so:%.c
	$(CC) -fPIC -shared $(INCLUDE_FLAG) $(LIB_FLAG) ./$< -o $(BUILD_DIR)$@
rsync_dir:
	rsync -a --include='*/' --exclude='*' $(SOURCE_DIR) $(BUILD_DIR)

.PHONY: clear

clear:
	-rm $(BUILD_DIR)* -r