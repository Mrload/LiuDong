

^M

> linux查看

```bash

cat -A file
```

> 修改
> vim

```vim
# vim 内
:set ff=unix
:wq
```
> 修改
> sed

```sed
sed -i "s/\r//" filename
# 或者
sed -i "s/^M//" filename
```
> 修改
> dos2unix  需要装软件