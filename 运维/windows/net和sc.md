# net

```dos
net start 服务名
 
net stop 服务名
```

注：

① net命令不只用于服务，还可用于网络、用户、登录等大部分

② net命令对禁用的服务无效

# sc

> sc是专门用于服务相关的命令

```dos
sc start 服务名
 
sc stop 服务名
 
sc config 服务名 start= demand //启动类型：手动
sc condig 服务名 start= auto //启动类型：自动
sc config 服务名 start= disabled //启动类型：禁用
```

sc命令优于 net命令的一点是，可以启动禁用状态的服务

