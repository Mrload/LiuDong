
# 仓库

```powershell
$ scoop bucket known
main
extras
versions
nightlies
nirsoft
php
nerd-fonts
nonportable
java
games
jetbrains


$ scoop bucket add <bucketname>
$ scoop bucket add <bucketname> https://github.com/xxx/xxx

```

# 安装软件

```powershell
# 第三方仓库安装
$ scoop install <bucketname>/<app>

```

# 清理安装包缓存

- `scoop cache show` - 显示安装包缓存
- `scoop cache rm <app>` - 删除指定应用的安装包缓存
- `scoop cache rm *` - 删除所有的安装包缓存

