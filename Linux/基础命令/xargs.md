把标准输出转换为标准输入

**参数**
***
-0, --null
	以null为分隔符分割标准输入，目前也就和find ... -print0结合一下

-d
	指定分隔符

-i
	使用标准输入替换{}的位置
 
```bash
# 复制所有文件至 temp
find -type f | xargs -i cp {} temp

```

> 并发参数

-P 加线程数


> 多个组合

```bash
# 五个一行输出
cat xxx|xargs -n 5|xargs -i {} echo {}
```