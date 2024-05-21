# Docker Security - disable shell options

Option1: Remove bash and sh
``` RUN rm /bin/bash /bin/sh ```

and use language specifc binary to execute the program such a go binary or python etc
ENTRYPOINT ["myapp"]
CMD ["--default-flag"]

For example in Dockerfile build a binary 'hello' and use it

```FROM golang:1.21```
```RUN go build -o /bin/hello ./main.go```
```CMD ["/bin/hello"]```

Using seccomp profile:
Create a custom seccomp profile (seccomp.json) that blocks shell-related syscalls and apply it when running the container.
```docker run --security-opt seccomp=seccomp.json myimage ```

Seccomp (Secure Computing Mode) is a Linux kernel feature that can be used to restrict the system calls available to a process, thereby enhancing security. You can use a seccomp profile to restrict shell access in a container by disabling system calls commonly used by shells.

See the file seccomp-profile.json profile allows all system calls except execve and execveat, which are blocked and will return an error if invoked

# Test the seccomp

1. build the image from Dockerfile1 ( change name to Dockerfile )
```docker build -t test-seccomp .```
docker image ls
REPOSITORY   IMAGE ID        CREATED          SIZE
test-seccomp  0b46f3305205   25 seconds ago   7.38MB

2. Run the container with profile 
```docker run --rm --security-opt seccomp=seccomp-profile.json test-seccomp```
above lines gives error 
standard_init_linux.go:211: exec user process caused "operation not permitted"

NOTE: This command runs the container with the specified seccomp profile, effectively blocking the execution of any new binaries, including shells.

3. Attempt to invoke a shell inside the container ( NOTE: The container must be RUNING)
```docker exec -it $(docker ps -q -f ancestor=test-seccomp) /bin/sh``