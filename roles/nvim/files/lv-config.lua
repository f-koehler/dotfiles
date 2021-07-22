O.format_on_save = true
O.lint_on_save = true
O.completion.autocomplete = true
O.colorscheme = "spacegray"
O.default_options.wrap = true
O.default_options.timeoutlen = 100
O.default_options.relativenumber = false
O.keys.leader_key = "space"

O.plugin.dashboard.active = true
O.plugin.terminal.active = true
O.plugin.zen.active = false
O.plugin.zen.window.height = 0.90
O.plugin.nvimtree.side = "left"

O.treesitter.ensure_installed = "all"
O.treesitter.highlight.enabled = true

-- python
O.lang.python.isort = true
O.lang.python.linters = { "flake8", "mypy" }
O.lang.python.diagnostics.virtual_text = true
O.lang.python.analysis.use_library_code_types = true
O.lang.python.formatter.exe = "black"
O.lang.python.formatter.args = {"-"}
