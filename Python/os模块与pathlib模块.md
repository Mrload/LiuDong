
# pathlib

	pathlib有两个主要的类

		PurePath
			主要处理字符串
			
		Path 是 PurePath的子类
			文件实例，拥有实例方法与属性
			
## path

### 实例化方法


```python
# 传入字符串

import pathlib

path_obj = pathlib.Path('/a/b/c/d.txt')

```

```python
# 传入多个字符串，会自动拼接
import pathlib

path_obj = pathlib.Path('/a','b','c','d.txt')

```

## 实例属性

	name str 最后一个文件的全名称

	stem str 最后一个文件，除去扩展名后的文件名

	parent Path实例，父级目录

	parents Path实例列表，逐个层级的父节点，parent位于index 0 的位置

	parts 元组，拆分整个路径，index 0 为/，index -1 为 name

	root str, 根，'/'

	suffix str, 后缀，多个.分割的话，为最后一个

	suffixes arr, 后缀列表

## 实例方法

	obsolute() Path实例，绝对路径

	cwd() Path实例， 当前工作目

	home() Path实例，用户家目录

	exists() boolen 实例是否存在
  
	touch() None,创建该实例为文件，若已存在，啥也不做，也没有返回值

	mkdir() None,创建该实例为文件夹，若已存在，报错

	rmdir() None,删除该实例对应的文件夹，且必须是空的

	with_name() Path实例，返回一个把最后一个文件名改掉了的实例

	with_stem() Path实例，返回一个把最后一个文件名[不改后缀]，改掉的实例

	iterdir() 迭代器，实例必须存在，返回该目录实例下的所有文件与文件夹路径的迭代器

	glob() 目录下数据遍历  **代表文件夹  *代表文件
	rglob() 目录及子目录遍历
# 遍历

```python
src_path = '路径'

for root, dirs, files in os.walk(scr_path):
	# for _dir in dirs:
	# for file in files:
		# do_something

	for 
```