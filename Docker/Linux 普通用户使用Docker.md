
> 默认情况下，只有root用户和docker组的用户才能运行Docker命令。我们可以将当前用户添加到docker组，以避免每次使用Docker时都需要使用sudo

```
sudo usermod -aG docker $USER
```

> **重新登录才能使更改生效**

