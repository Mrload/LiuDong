
# ERROR 429

> 使用requests多次访问同一个ip时，尤其是在高频率访问下，http连接太多没有关闭导致的Max retries exceeded with url 的错误

> 关闭请求

```python
resp = requests.get("xxx")
resp.close()
```

> 请求头长连接

```
headers = {'Connection':'close'}
...

```