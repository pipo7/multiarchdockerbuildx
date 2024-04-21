# Using Multistage Dockerfile
build image docker build -t hello .

Size of golang:1.21 is 815MB
Size of hello image with just binary is 1.8MB

Run the image as :
docker run hello:latest
hello, world

Using named builds
build image as : 
build image docker build -t hellonamedbuild .

docker run hello
hello, world named builds

# Building multiarch
export DOCKER_BUILDKIT=1
export DOCKER_CLI_EXPERIMENTAL=enabled
docker buildx --help ```To see that buildx is enabled```
docker buildx create --name mybuilder --platform "linux/amd64,linux/arm64" --driver=docker-container --use
docker buildx inspect --bootstrap

# login to registry , pass user and token securely to CLI
DOCKER_REGISTRY: artifactory.company.com
docker login -p="${ARTIFACTORY_TOKEN}" -u="${ARTIFACTORY_USER}" $DOCKER_REGISTRY

# set the following params and use buildx to build multiArch images
REMOTE_IMAGE_NAME := $(DOCKER_REGISTRY)/$(DOCKER_REPO)/$(IMAGE_NAME)
DOCKER_REGISTRY :=  docker.registry.com ``` artifactory.company.com```
DOCKER_REPO := test_multi_arch
IMAGE_NAME := go-multi-arch
TAG := v1.0 
docker buildx build --rm --push --platform linux/amd64,linux/arm64 -t $(REMOTE_IMAGE_NAME):$(TAG) .
