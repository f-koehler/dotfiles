lvim.format_on_save = true
lvim.lint_on_save = true
-- lvim.colorscheme = "spacegray"
lvim.leader = "space"

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.highlight_enabled = true

lvim.lsp.diagnostics.virtual_text = false

lvim.plugins = {
    {"dstein64/vim-startuptime"},
}

lvim.lang.python.formatters = {
  {
    exe = "black",
    args = {}
  }
}
lvim.lang.python.linters = {
  {
    exe = "flake8",
    args = {}
  }
}
