
**参数**
***
clone 
	克隆仓库至本地

init path
	初始化仓库

# git add .
添加某些文件至暂存区

git remote add name URL
	添加远程仓库

git push remote 本地分支:远程分支
	分支名称相同则只填写一个分支名称

git push remote --delete branch
	删除主机某分支

git push --force remote branch
	强制推送

git branch
	列出分支

git branch name
	创建分支

git branch -d branchname
	删除分支

git checkout branchname
	切换分支

git merge branchname
	将xx分支合并到当前分支

# remote 远程管理

# config 配置管理
***
## options

### 生效范围
- --system 系统级别，位于/etc/gitconfig
`git config --system --list`

- --global 用户级别，位于~/.gitconfig
`git config --global --list`

- --local 工作目录下，本地仓库./.git/config
`git config --local --list`

- --worktree 和 --file \<filename\>
没用过， 不知道啥用

### 操作
- --add 添加新配置，不更改其它配置
- --get 获取配置，同一个键下多个值，返回最后一个，未找到返回-1
- -l --list 列出所有配置项
- --unset 移除对应匹配配置项，同一个键下多个值，猜测是移除最后一个
- --unset-all 移除所有匹配配置项
- -e --edit 使用默认编辑器修改配置

```git
# 修改git默认编辑器
git config --global core.editor vim
```
