# Using Multistage Dockerfile
build image docker build -t hello .

Size of golang:1.21 is 815MB
Size of hello image with just binary is 1.8MB

Run the image as :
docker run hello:latest
hello, world