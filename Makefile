TAGNAME = mcc_daq

.PHONY: build
buildall:
	docker build base_gcc -t base_gcc
	docker build . -t $(TAGNAME)

.PHONY: run
run: 
	docker run --rm -it \
	--device=/dev/mcc_daq \
	--network=host \
	mcc_daq

docker run -it $(shell for dev in /dev/bus/usb/001/*; do echo -n "--device $dev:$dev "; done)  mcc_daq
