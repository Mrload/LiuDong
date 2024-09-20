
```
主要是命令行的配置，以MinGW64为例，命令行为：

C:\msys64\msys2_shell.cmd -defterm -no-start -use-full-path -here -mingw64

选择msys2_shell.cmd所在位置后，需要添加一系列参数：

-defterm 表示启动的是bash
-no-start 表示不使用start命令启动，如果没有这个参数则不会显示在Windows终端，则是新开一个控制台
-use-full-path 表示使用windows系统的PATH环境变量
-here 表示使用当前目录作为工作目录
-mingw64 表示Shell的类型为MinGW64，有效的类型可以参见msys2_shell.cmd内的Usage
```