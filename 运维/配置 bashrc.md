

```shell
# 当前登录ip
ipAddr=`who -m |grep -P "\d+\.\d+\.\d+\.\d+" -o`
if [[ $ipAddr == "192.168.4.233" ]]; then
	echo "刘东电脑登录"
	conda activate Mrload
fi

# cheat
PATH_DIR="$HOME/.local/bin"
if [[ ! -f $PATH_DIR/cht ]]; then
	mkdir -p $PATH_DIR
	curl https://cht.sh/:cht.sh > "$PATH_DIR/cht"
	chmod +x "$PATH_DIR/cht"	
fi
unset PATH_DIR

# bash prompt
# conda 配置不修改ps1
conda config --set changeps1 false
export PS1='\[\e[38;5;208m\]┌──[\A]-[$CONDA_DEFAULT_ENV]-[\j]-[\u@\h:\w]\n└─\$ \[\e[0m\]'
```