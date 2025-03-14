find Path exp
	递归查找与处理

**参数**
***
-type
	类型 f-文件，d-文件夹，l-链接

-mindepth/-maxdepth
	最大/最小递归等级

-empty
	文件或目录为空的

-name
	名称匹配，可用通配符 * ？ []
	不会匹配 . 和 ..

-size ±n
	尺寸范围 ，单位需要查一下，不会用

**动作**
***
-exec cmd {} \;
	明白就行

-print0
	文件结尾为null,而非回车

-printf
	\\n 换行
	%f 文件名
	%h 路径除去文件名
	其他的man一下