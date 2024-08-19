
# ERROR 429 Max reties

> 使用requests多次访问同一个ip时，尤其是在高频率访问下，http连接太多没有关闭导致的Max retries exceeded with url 的错误

> 关闭请求 - 无效

```python
resp = requests.get("xxx")
resp.close()
```

> 请求头长连接 - 无效

```
headers = {'Connection':'close'}
...

```

>  设置重连次数

```python
# 重连接次数： 
requests.DEFAULT_RETRIES = 5
```