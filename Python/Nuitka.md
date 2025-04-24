

Nuitka是一个用Python编写的Python编译器。
它与Python2.6, 2.7, 3.4-3.12完全兼容。
你给它输入你的Python应用程序，它会做很多聪明的事情，然后输出一个可执行或扩展模块。


# Requirements

- C 编译器 至少配置一个
> 你需要一个支持C11的C编译器，或者一个支持c++ 03的c++编译器。
> gcc >= 5.1 
> g++ >= 4.4
> clang /clang-cl

- patchelf 工具，--onefile 或者 --standalone里使用
> [NixOS/patchelf: A small utility to modify the dynamic linker and RPATH of ELF executables (github.com)](https://github.com/NixOS/patchelf)

# Usage

## installation

```bash 
pip install nuitka
```



