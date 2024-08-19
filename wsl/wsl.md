

# 打开服务


# 升级

```powershell
wsl --update
```

# 配置文件

## .wslconfig
> windows下的配置文件,用户家目录下${home}

### 镜像网络

```toml
[wsl2]
networkingMode=mirrored
```

## wsl.conf
> linux 下的配置文件, /etc/wsl.conf

### 开启systemd
```toml
[boot]
systemd=true
```
### 启动error：UtilTranslatePathList:2866
```toml
[interop]
appendWindowsPath=false
```


