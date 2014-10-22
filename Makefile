COMPONENT = apache-buildr
IMAGE_PREFIX = vanto/
BUILD_TAG = 1.4.20-jruby-jdk7
IMAGE = $(IMAGE_PREFIX)$(COMPONENT):$(BUILD_TAG)

build: check-docker
	docker build --rm=true -t $(IMAGE) .

clean: check-docker
	docker rmi $(IMAGE)

full-clean: check-docker
	docker images -q $(IMAGE_PREFIX)$(COMPONENT) | xargs docker rmi -f

release:
	docker push $(IMAGE)

check-docker:
	@if [ -z $$(which docker) ]; then \
	  echo "Missing \`docker\` client which is required for development"; \
	  exit 2; \
	fi
