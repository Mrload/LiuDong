
# 参数

**必要参数**

| 参数  | 解析                    |
| --- | --------------------- |
| -A  | 新增压缩文件到已存在的压缩         |
| -B  | 设置区块大小                |
| -c  | 建立新的压缩文件              |
| -d  | 记录文件的差别               |
| -r  | 添加文件到已经压缩的文件          |
| -u  | 添加改变了和现有的文件到已经存在的压缩文件 |
| -x  | 从压缩的文件中提取文件           |
| -t  | 显示压缩文件的内容             |
| -z  | 支持gzip解压文件            |
| -j  | 支持bzip2解压文件           |
| -Z  | 支持gzip解压文件            |
| -v  | 显示操作过程                |
| -l  | 文件系统边界设置              |
| -k  | 保留原有文件不覆盖             |
| -m  | 保留文件不被覆盖              |
| -W  | 确认压缩文件的正确性            |

**可选参数：**

| 参数       | 解析      |
| -------- | ------- |
| -b       | 设置区块数目  |
| -C       | 切换到指定目录 |
| -f       | 指定压缩文件  |
| –help    | 显示帮助信息  |
| –version | 显示版本信息  |

# 打包

**将文件整合在一起，不压缩。**

```bash
tar cf a.tar /etc/
```

# 列出文档内容

```bash
tar tf a.tar
```

# 提取文档内容：

```bash
tar xf a.tar
```


# 压缩

```bash
tar[必要参数][选择参数][目标文件名][源文件名]
```

## 常见压缩

`gzip`：压缩速度最快，历史最久，应用最广泛；  
`bzip2`：压缩成的存档文件小，可用性不如gzip；  
`xz`：最新的方式，提供最佳的压缩率。  
**注**：实际中三种情况都可能遇到，所以必须有一定的命名方式  

`z`用于gzip压缩：

```bash
filename.tar.gz
```

`j`用于bzip压缩：

```bash
filename.tar.bz2
```

`J`用于xz压缩：

```bash
filename.tar.xz
```

## 压缩命令

1. gzip压缩：

```bash
tar zcf a.tar.gz a.tar
```

2. bzip2缩：

```bash
tar jcf a.tar.bz2 a.tar
```

3. xz压缩：

```bash
tar Jcf a.tar.xz a.tar
```

## 压缩率对比：

```bash
xz > bzip2 > gzip
```

# 解压

 - 解压缩文件加一个参数x：

```bash
tar xf a.tar.gz
```

- 其他类型解压：

```bash
tar xf a.tar.bz2
tar xf a.tar.xz
```

# 常见解压、压缩命令

1、tar
解包：tar xvf FileName.tar
打包：tar cvf FileName.tar DirName
（注：tar是打包，不是压缩！）

2、.gz
解压1：gunzip FileName.gz
解压2：gzip -d FileName.gz
压缩：gzip FileName

3、.tar.gz 和 .tgz
解压：tar zxvf FileName.tar.gz
压缩：tar zcvf FileName.tar.gz DirName

4、.bz2
解压1：bzip2 -d FileName.bz2
解压2：bunzip2 FileName.bz2
压缩： bzip2 -z FileName

5、.tar.bz2
解压：tar jxvf FileName.tar.bz2
压缩：tar jcvf FileName.tar.bz2 DirName

6、.bz
解压1：bzip2 -d FileName.bz
解压2：bunzip2 FileName.bz
压缩：未知

7、.tar.bz
解压：tar jxvf FileName.tar.bz
压缩：未知

8、.Z
解压：uncompress FileName.Z
压缩：compress FileName

9、.tar.Z
解压：tar Zxvf FileName.tar.Z
压缩：tar Zcvf FileName.tar.Z DirName

10、.zip
解压：unzip FileName.zip
压缩：`zip FileName.zip FileName`
压缩：`zip -r DirName.zip DirName`

11、.rar
解压：rar x FileName.rar
压缩：rar a FileName.rar DirName
