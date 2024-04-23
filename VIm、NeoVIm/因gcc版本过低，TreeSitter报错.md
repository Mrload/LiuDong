> 非root用户为自己安装gcc

可以使用conda、pip、或自己编译安装，pip下版本有限制

> 更新用户下环境变量，.bashrc

添加gcc的bin路径至$PATH

> CC变量

按照官网方法配置并没有生效，不晓得是不是哪里有问题
[官网参考](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)


试着添加环境变量CC，成功
```bash
export CC=/xx/xx/xx/gcc/bin/gcc
```