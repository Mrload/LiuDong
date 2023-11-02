# 安装

# 配置

## 前提：Git得安装吧

## 前提：仓库相关初始化

```git

cd Path
git init

#添加远程仓库
git remote add remoteName url

# 将项目文件设置为安全文件夹
git config --global --set safe.directory <项目绝对路径>
```

## 自动备份配置
![[obsidian-git-config1.png]]
### 分割自动提交与推送

	插件是提交与推送一起进行的，我没有分割


![[obsidian-git-config2.png]]
### 推送前先拉取
	Pull changes before push
	把这玩意打开