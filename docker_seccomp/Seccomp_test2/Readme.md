

# Test the seccomp

1. build the image from Dockerfile 
```docker build -t custom-entrypoint .```
```docker run --rm -it --security-opt seccomp=seccomp-profile.json custom-entrypoint sleep 10 ```
NOTE: This command runs the container with the specified seccomp profile, effectively blocking the execution of any new binaries, including shells.