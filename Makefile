TAGNAME ?= mcc_daq
DAQDEV ?= $(TAGNAME)

.PHONY: build
buildall:
	docker build base_gcc -t base_gcc
	docker build . -t $(TAGNAME)

.PHONY: run
run: 
	docker run --rm -it \
	--device=$(shell readlink -f "/dev/$(DAQDEV)") \
	--network=host \
	$(TAGNAME)

