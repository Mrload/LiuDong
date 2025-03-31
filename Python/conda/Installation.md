
```bash
usage: Miniconda3-latest-Linux-aarch64.sh [options]

Installs Miniconda3 py312_24.7.1-0

-b           run install in batch mode (without manual intervention),
             it is expected the license terms (if any) are agreed upon
-f           no error if install prefix already exists
-h           print this help message and exit
-p PREFIX    install prefix, defaults to /home/hzhy/miniconda3, must not contain spaces.
-s           skip running pre/post-link/install scripts
-m           disable the creation of menu items / shortcuts
-u           update an existing installation
-t           run package tests after installation (may install conda-build)

```

1. **安装路径参数**  
   -  `-p`：在安装脚本中指定安装路径。例如：  
     ```bash
     bash Miniconda3-latest-Linux-x86_64.sh -p /custom/path
     ```  
     默认路径通常是用户主目录下的`anaconda3`或`miniconda3`文件夹，此参数可自定义安装位置。

2. **静默安装**  
   - **`-b`**：以批处理模式（无交互提示）安装，适用于自动化脚本。例如：  
     ```bash
     bash Anaconda3-*.sh -b
     ```  
     安装完成后需手动将Conda路径添加到环境变量。

3. **环境变量配置**  
   - **`-s`**：在安装过程中自动将Conda添加到系统环境变量（`PATH`）。需谨慎使用，可能与其他Python环境冲突。无需单独执行`conda init --all`

## 安装脚本执行后
```bash
# 未指定`-s`参数安装时

~/miniconda3/bin/conda init   # 为各个环境提供初始化
source ~/.bashrc  # 重载bash环境

```
