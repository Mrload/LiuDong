# remote sync 远程同步

# 用法

rsync [option] SRC DST

SRC DST
	user@host:path 使用ssh协议
	user@host::path 使用rsync协议
	
# 参数

	-a 保持文件属性

	-r 递归

	-v 显示详细信息

	-u 仅复制更新的文件

	--delete 删除目的中没有源中的文件

	-H 保留硬链接

	--progress 在传输时现实传输过程

	--partial 保留那些因故没有完全传输的文件，以是加快随后的再次传输



```bash
rsync -a src/ dst/  # 同步src文件夹下数据至dst文件夹下，无需写成src/*，保留数据信息（权限，属主，属组，修改时间等）
src dst/  # 这种写法完成dst/src
src/ dst/ # 这种写法将src下所有文件拷贝到dst下
```

+ -a 递归且保留文件信息，
+ -v 显示详细信息
+ --progress  显示同步进度
+ --partial 断点续传，保留在rsync中断时只传输了一部分的文件
+ -P  等同于--partial --progress 

+ --info=FLAGS
  - PROGRESS   Mention 1) per-file progress or 2) total transfer progress
  > 1 单个文件进度  2 总体度


```bash
rsync -a --info=progress2 src/ dst/
```


## 排除指定文件/文件夹

```bash
rsync -av --exclude={'media','node_modules'} DTP-V2/ DTP-V3/
```
