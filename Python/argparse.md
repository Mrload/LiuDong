

[argparse 教程 — Python 3.12.6 文档](https://docs.python.org/zh-cn/3/howto/argparse.html)

```python
import argparse

# 实例
parser = argparse.ArgumentParser()

# 添加参数
parser.add_argument("-s","--long",help="说明",type=str,default="ABC")
...
# 解析
args = parser.parse_args()

# 提取
s = args.long

```

## 参数

[argparse --- 用于命令行选项、参数和子命令的解析器Parser for command-line options, arguments and subcommands — Python 3.13.0 文档](https://docs.python.org/zh-cn/3/library/argparse.html#argparse.ArgumentParser.add_argument)


`help`

`required`

`default`

`type`

