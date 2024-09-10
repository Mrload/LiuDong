
# 默认shell

- docker file 默认使用  /bin/sh

> 修改为bash，例如`source ~/.baserc`,`sh`无法完成



```Dockerfile
FROM ubuntu:24.10
SHELL ["/bin/bash", "-c"]
...
```


