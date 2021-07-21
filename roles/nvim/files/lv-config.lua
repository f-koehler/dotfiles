O.auto_complete = true
O.default_options.relativenumber = false
O.colorscheme = "spacegray"
O.default_options.timeoutlen = 100
O.leader_key = " "


O.plugin.dashboard.active = true
O.plugin.zen.active = true

O.treesitter.ensure_installed = "all"
O.treesitter.highlight.enabled = true

-- lua
O.lang.lua.autoformat = true
O.lang.lua.formatter = "lua-format"


-- python
O.lang.python.autoformat = true
O.lang.python.isort = true
O.lang.python.linter = "flake8"
O.lang.python.diagnostics.virtual_text = true
O.lang.python.analysis.use_library_code_types = true
O.lang.python.formatter.exe = "black"
O.lang.python.formatter.args = {"-"}
