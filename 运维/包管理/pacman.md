# -S [--sync]

```bash
用法:  pacman {-S --sync} [选项] [软件包]
选项:
  -b, --dbpath <路径>  指定另外的数据库位置
  -c, --clean          从缓存目录中删除旧软件包 (-cc 清除所有)
  -d, --nodeps         跳过依赖关系的版本检查 (-dd 跳过所有检查)
  -g, --groups         查看某软件包组所属的所有软件包
                       (-gg 查看所有软件包组和所属于它们的软件包)
  -i, --info           查看软件包信息 (-ii 查看更多信息)
  -l, --list <repo>    查看在该软件库中的软件包清单
  -p, --print          打印目标而不是执行操作
  -q, --quiet          在查询或搜索时显示较少的信息
  -r, --root <路径>    指定另外的安装根目录
  -s, --search <正则表达式> 按照指定字符串查询远端软件库
  -u, --sysupgrade     升级所有已安装的软件包 (-uu 可启用降级)
  -v, --verbose        显示详细信息
  -w, --downloadonly   下载但不安装/升级软件包
  -y, --refresh        从服务器下载新的软件包数据库
                       (-yy 强制更新软件包数据库)
      --arch <架构>    指定另外的架构
      --asdeps         作为非单独指定安装的软件包安装
      --asexplicit     作为单独指定安装的软件包安装
      --assume-installed <package=version>
                       添加一个虚拟包用以满足依赖要求
      --cachedir <dir> 指定另外的软件包缓存位置
      --color <when>   彩色化输出
      --config <路径>  指定另外的配置文件
      --confirm        总是询问确认
      --dbonly         仅修改数据库条目，而非软件包文件
      --debug          显示调试信息
      --disable-download-timeout
                       下载时用宽松的超时
      --gpgdir <路径>  指定 GnuPG 的另外的主目录
      --hookdir <目录>  指定另外的钩子位置
      --ignore <软件包>   升级时忽略某个软件包 (可多次使用)
      --ignoregroup <软件包组>
                         升级时忽略某个软件包组 (可多次使用)
      --logfile <路径> 指定另外的日志文件
      --needed         不重新安装已是最新的软件包
      --noconfirm      不询问确认
      --noprogressbar  下载文件时不显示进度条
      --noscriptlet    不执行安装小脚本
 --overwrite <glob>
                        覆盖冲突的文件（可以指定多次）
      --print-format <字符串>
                       指定如何打印目标
      --sysroot        在一个已挂载的 guest 系统操作（仅 root）
```