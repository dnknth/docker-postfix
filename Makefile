TAG = latest
DOCKER = podman
# DOCKER = docker

.PHONY: image push

image:
	$(DOCKER) build -t dnknth/alpine-postfix:$(TAG) .

push: image
	$(DOCKER) push dnknth/alpine-postfix:$(TAG)
