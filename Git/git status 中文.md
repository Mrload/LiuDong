
- 原因  
    在默认设置下，中文文件名在工作区状态输出，中文名不能正确显示，而是显示为八进制的字符编码。
    
- 解决办法  
    将git 配置文件 `core.quotepath`项设置为false。  
    quotepath表示引用路径  
    加上`--global`表示全局配置

```bash
git config --global core.quotepath false

```