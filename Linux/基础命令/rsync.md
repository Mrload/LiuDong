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

