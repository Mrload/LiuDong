
```bash
pwiz.py --help

Usage: pwiz.py [options] database_name

Options:
  -h, --help            show this help message and exit
  -H HOST, --host=HOST  
  -p PORT, --port=PORT  
  -u USER, --user=USER  
  -P, --password        
  -e ENGINE, --engine=ENGINE
                        Database type, e.g. sqlite, mysql, postgresql or
                        cockroachdb. Default is "postgresql".
  -s SCHEMA, --schema=SCHEMA
  -t TABLES, --tables=TABLES
                        Only generate the specified tables. Multiple table
                        names should be separated by commas.
  -v, --views           Generate model classes for VIEWs in addition to
                        tables.
  -i, --info            Add database information and other metadata to top of
                        the generated file.
  -o, --preserve-order  Model definition column ordering matches source table.
  -I, --ignore-unknown  Ignore fields whose type cannot be determined.
  -L, --legacy-naming   Use legacy table- and column-name generation.


pwiz.py --host HOST -p 3306 --user USERNAME --engine=mysql --password [不要填] --tables [表名称] [数据库名称]  >> 追加写入位置
```
