```bash
manage.py inspectdb [-h] [--database DATABASE] [--include-partitions] [--include-views] [--version] [-v {0,1,2,3}] [--settings SETTINGS]
                           [--pythonpath PYTHONPATH] [--traceback] [--no-color] [--force-color]
                           [table ...]
```

- inspectdb 可以用于从现有数据库生成model

  - --database 指定设置中DATABASES配置中的数据库名称
  - [table] 特定的表名称

> 命令会将model代码打印，保存的话需要重定向输出