分割文件或标准输入
usage:
> split [OPTION]... [FILE [PREFIX]]

**参数**
***

-l , --lines=NUMBER
	每一份切割文件的行数

-d
	--numberic-suffixes=NUM  同-d，但是允许设置初始值
	使用从数字0开始的后缀

-n  控制分割的数量

-b, --bytes=SIZE
	每一份分割文件的大小 K M G T

-a
	shuffix长度，默认为2 "00"

