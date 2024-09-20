# 执行mv

# 修改`$HOME/.bashrc`

	将conda相关路径修改为新路径

# 修改conda新路径下 `./bin/`下命令

```bash
#!/bin/bash
for file in $(find /home/mrload/.local/anaconda3/bin/ -type f); do
        headLine=$(head -n1 $file)
        srcLine="#!/home/mrload/local/anaconda3/bin/python3.9"
        newLine="#!/home/mrload/.local/anaconda3/bin/python3.9"
        if [ ${#headLine} != ${#srcLine} ]; then
                continue
        elif [[ $headLine == $srcLine ]]; then
                echo $file
                sed -i -e "1i$newLine" -e "1d" $file
        fi
done
```

