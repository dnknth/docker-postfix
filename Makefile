TAG = latest-$(subst aarch64,arm64,$(shell uname -m))

.PHONY: image push

image:
	docker build -t dnknth/alpine-postfix:$(TAG) .

push: image
	docker push dnknth/alpine-postfix:$(TAG)

manifest: push
	docker manifest create \
		dnknth/alpine-postfix \
		--amend dnknth/alpine-postfix:latest-x86_64 \
		--amend dnknth/alpine-postfix:latest-arm64
	docker manifest push --purge dnknth/alpine-postfix
