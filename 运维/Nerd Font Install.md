
> fc-cache
> apt install fontconfig



```bash
#!/bin/bash


font_url='url'
font_name=${font_url##*/}
font_path="$HOME/.local/share/fonts"
mkdir -p ${font_path}
wget ${font_url} && unzip ${font_name} -d ${font_path}
fc-cache -fv
unset font_url
unset font_name
```

