
# select

	创建select-query实例

# get_or_none

	与get一致，若不匹配则返回None

# get_by_id


```python
DModel.get_by_id(pk)
# 等同于
DModel.get(DModel.id == pk)
```

# update

```bash
# 返回一个sql
sql = DModel.update(DModel.Field1="xx").where(DModel.Field2 == "xxxxx")
# 返回收到影响的row数量
modified_rows_num = sql.execute()
```

> 原子更新
> `update(DModel.Field1=DModel.Fielld2+"ABC")`


# 批量更新 bulk_update

```python
# 批量更新

# DModel.bulk_update(model_list,fields,batch_size)
User.bulk_update([u1, u2, u3], fields=[User.username])
```