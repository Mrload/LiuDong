
## 配置
```bash
git config --global user.email  "xxx@xxx.com"
git config --global user.name  "LiuDong"
```

> `git config` 不使用`--global` 即`--local` 
> `--global` 用户级别
> `--local` 仓库级别

## 常规

### add commit
```bash

git add <file>/.

git commit -m "msg"
kao
# 仅会add+commit已跟踪的文件
git commit -am "msg"
```

### log  relog reset
```
git log  # 当前分支的日志

git relog  # 当前仓库的日志，包括回滚后的分支

git reset --hard "commit-head"  # 回滚
```

### switch[branch checkout]
```bash
# git branch  # 查看所有分支
git switch

# git branch bname  # 已当前提交为根，创建bname分支
git swich -c bname

# git chechout bname  # 切换到bname分支,旧版
git switch bname  # 切换到bname分支

git branch -d bname  # 删除分支

```

### merge
```bash
git checkout brA

git merge brB

# 解决冲突

git add .
git commit -m "解决冲突，合并分支brB"

git branch -d brB

# 切到分支A,将分支B合并(解决冲突)，删掉B分支
```

### push pull
```
git remote add rmtName rmt-addr  # 新增远程仓库

git push rmtName brName  # 向远程仓库rmtName 推送分支 brName
`-u`参数的作用：--set-upstream，首次推送后，后续就无需指定了，直接git push

git pull rmtName brName # 拉取仓库的最新改动
# 等同于 git fetch rmtName brName && git merge rmtName/brName
```

### rebase 变基
```bash
# 从第一次提交开始，每日一次提交
C1 --> day1 --> day2 --> day3 --> day4 --> day5(done)

#
```

### 开发工作流(双向合并)
```bash
git init

git add . && git commit -m "Init"

git switch -c dev  # 创建切换开发分支

# ... 开发分支上开发
# ... 功能完成后

git switch master && git merge dev  # 在主分支上合并开发分支

git switch dev && git merge master  # 在开发分支上合并主分支，继续开发

...

```






