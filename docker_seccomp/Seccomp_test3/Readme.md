# Example to block chmod 

Use the references seccomp-profile 

```$ docker run --rm -it --security-opt seccomp:/home/smakam14/seccomp/profile.json busybox chmod 400 /etc/hosts```
chmod: /etc/hosts: Operation not permitted

Disabled profile using 'unconfined'
```docker run --rm -it --security-opt seccomp=unconfined busybox sleep 10 ```