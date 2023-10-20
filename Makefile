TAG = latest

.PHONY: image push

image:
	docker build -t dnknth/alpine-postfix:$(TAG) .

push: image
	docker push dnknth/alpine-postfix:$(TAG)
