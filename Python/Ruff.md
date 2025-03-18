
# NeoVim lsp

```lua
require('lspconfig').ruff.setup({
  init_options = {
    settings = {
      -- Ruff language server settings go here
    }
  }
})

```

>如果你将 Ruff 与其他语言服务器（如 Pyright）一起使用，你可能希望使用该语言服务器的某些功能

```lua
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})
```

> 如果你想专门使用 Ruff 进行 linting、格式化和组织导入，你可以为 Pyright 禁用这些功能：

```lua
require('lspconfig').pyright.setup {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}
```
> 默认情况下，Ruff 不会显示任何日志。要在 Neovim 中启用日志记录，您需要将[`跟踪`](https://neovim.io/doc/user/lsp.html#vim.lsp.ClientConfig)设置设置为 `messages` 或 `verbose`，并使用 [`logLevel`](https://docs.astral.sh/ruff/editors/settings/#loglevel) 设置更改日志级别：

```lua
require('lspconfig').ruff.setup {
  trace = 'messages',
  init_options = {
    settings = {
      logLevel = 'debug',
    }
  }
}
```

# Settings

## pyproject.toml

```toml
[tool.ruff]
# 排除
exclude = [".venv"]

extend = "../pyproject.toml"

# 排除format 和lint
extend-exclude = ["tests", "src/bad.py"]
# 额外包含的文件
extend-include = ["*.pyw"]

# 缩进空格数
indent-width = 2

# 行
line-length = 120
[tool.ruff.analyze]
[tool.ruff.format]
#空格缩进
indent-style = "space"  # (default)


[tool.ruff]


```