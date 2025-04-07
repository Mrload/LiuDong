
## install

```bash
pip install uvicorn
```

## 启动
> workers 在有reload参数时不生效
> 新的版本没有这个警告提示了，未验证

### 命令行启动
```bash

# uvicorn "module:attribute" --host x.x.x.x --port xx --reload -- workers
uvicorn "main:app" --host 0.0.0.0 --port 8080 --reload --workers 6
```

### 脚本内
```python
# fastapi,main.py

from fastapi import FastAPI
import uvicorn

app = FastAPI()

if __name__ == "__main__":

	uvicorn.run("main:app",reload=True,host="0.0.0.0",port=8080,workers=6)
	
```