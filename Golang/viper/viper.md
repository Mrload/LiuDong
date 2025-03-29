
## Installation
```bash
go get github.com/spf13/viper
```

## Useage
```
|-config
  |-cfg.yaml
|-cmd
  |-main.go
```

### 显式指定配置文件

```go
func main (){
	viper.SetConfigFile("config/cfg.yaml")
}
```

> 相对于项目地址
> > 起始地址不可以写 /
> > 不能相对于当前文件的地址
> 要么使用绝对路径


### 隐式指定配置文件的路径、名称、类型

```go
// main.go

...

func main() {

    viper.AddConfigPath(".")  //当前项目
    viper.AddConfigPath("../config")  // 错误的地址，在项目外
    viper.AddConfigPath("/config")  // 绝对路径,在此是错误的
    viper.AddConfigPath("config")  // 正确
    viper.AddConfigPath("./config")  // 正确
	
    viper.SetConfigType("yaml")  // 指定文件类型，如果不配置，会匹配各种配置类型，json、toml、ini、yaml
    viper.SetConfigName("cfg")  // 指定配置文件的名称，如果`SetConfigType`配置了，可以给后缀，否则还是别给，会报错

    if err := viper.ReadInConfig(); err != nil {
        panic(err)
    }
}

```

> 相对于项目地址
> > `.`就是项目地址
> > `/config` 是绝对路径


### 读取配置

```go
...
func main(){
	...
    if err := viper.ReadInConfig(); err != nil {
        panic(err)
    }
}

```

> 避免未能读到配置


### 赋值给结构体

> 配置文件要和结构体一致
> 层级不一致就匹配不上
> tag `mapstructure:"cfgName"` 用于配置该项对应配置文件中的名称

```yaml
db:
	host: localhost
	port: 3306
	user: root
	passwd: root

service:
	host: 192.168.1.6
	port: 9000
	model:dev
	
```


```go
...
func main(){
	...
	type DBConf struct{
		DBName string `mapstructure:"host"`
		DBUser string `mapstructure:"user"`
		DBPass string `mapstructure:"passwd"`
		Port  int // 这个就匹配不上
	}
	type SVConf struct{
		Shost string `mapstructure:"host"`
	}

	type Config struct{
		DBcfg  DBConf  `mapstructure:"db"` 
		SVcfg  SVConf  // 这个匹配不上
	}

	var cfg Config
	if err := Viper.Umarshal(&cfg);err{
		panic("xxx")
	}
	// 结构体可以用了
}
```

