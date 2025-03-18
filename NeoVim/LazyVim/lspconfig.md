

> inlay hints  在neovim版本 >= 0.10以上默认开启
# basedpyright

> 除了 `python.pythonPath` 和 `python.venvPath` 之外，basedpyright 不支持前缀为 `python.*` 的设置。请改用 `basedPyRight.*` 。

```lua
-- lspconfig.lua
return {
	"nvim-lspconfig",
	opts = {
		servers = {
			basedpyright = {
				settings = {
					basedpyright = {
						-- basedpyright 配置项
						analysis={
							-- 嵌入式提示（nvim <0.1不生效，不晓得为啥）
							inlayHints={
								variableTypes=true,
								callArgumentNames=true,
								functionReturnTypes=true,
								genericTypes=true
							},
							-- 类型检查级别
							-- [“off”， “basic”， 
							-- “standard”，“strict”，
							-- “recommended”， “all”]
							typeCheckingMode="standard",
							-- 日志级别
							-- ["Error", "Warning", 
							--"Information", or "Trace"]
							logLevel="Warning"
							
						}
					}
				}
			}
		}
	}
}
```