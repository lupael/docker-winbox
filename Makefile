  
DOCKER ?= docker
TARGET ?= lupael/novnc-winbox

all:
	@echo "Building ${TARGET}"
	$(DOCKER) build -t $(TARGET) -f Dockerfile .

