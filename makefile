.DEFAULT_GOAL := build_pdf

DOCKER_IMAGE := ghcr.io/rrevo/nabuwords
DOCKER_CMD := docker run --rm -it -v $(PWD):/opt/repo --platform linux/x86_64 $(DOCKER_IMAGE) /bin/bash -c

.PHONY: build_pdf build_docker_image push_docker_image clean
.PHONY: print_os_version start_shell

# Docker targets
build_docker_image:
	docker build -t $(DOCKER_IMAGE) -f Dockerfile --progress=plain .

push_docker_image: build_docker_image
	docker push $(DOCKER_IMAGE):latest

build_pdf:
	$(DOCKER_CMD) "cd /opt/repo/books/1-dune && make"

clean:
	rm -rf releases/*.pdf

# Debug helpers
print_os_version:
	$(DOCKER_CMD) "cat /etc/*release"

start_shell:
	docker run -it -v $(PWD):/opt/repo $(DOCKER_IMAGE) /bin/bash
