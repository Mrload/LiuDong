> 直接修改是不可行的

```
AttributeError: property 'data' of 'Request' object has no setter
```

```python
def do_something(self,request,*args,**kwargs):
  request._mutable = True
  # 此时可以修改
  # ....
  request._mutable = False
```