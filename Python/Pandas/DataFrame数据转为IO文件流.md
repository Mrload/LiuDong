用于网页后端导出excel时，响应数据类型设置为stream

[pandas Writing Excel files to memory](https://pandas.pydata.org/docs/user_guide/io.html#writing-excel-files-to-memory)

```python
from io import BytesIO
bio = BytesIO()

# writer = pd.ExcelWriter(bio, engine="xlsxwriter")  # 可行引擎 openpyxl  
# 使用with
with pd.ExcelWriter(bio, engine="xlsxwriter") as writer:
  df.to_excel(writer, sheet_name="Sheet1")

# 调用流数据
bio.seek(0)

# return bio
```
