
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

	name 最后一个文件的全名称

	stem 
	

# 遍历

```python
src_path = '路径'

for root, dirs, files in os.walk(scr_path):
	# for _dir in dirs:
	# for file in files:
		# do_something

	for 
```