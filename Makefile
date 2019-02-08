TAGNAME ?= mcc_daq
DAQDEV ?= $(TAGNAME)

.PHONY: run
run: 
	docker run --rm -it \
	--device=$(shell readlink -f "/dev/$(DAQDEV)") \
	--network=host \
	$(TAGNAME)

