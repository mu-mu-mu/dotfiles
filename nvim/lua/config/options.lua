local opt = vim.opt

vim.cmd("syntax enable")

opt.wrap = false
opt.ruler = true
opt.number = true
opt.showcmd = true
opt.wildmenu = true
opt.cursorline = true
opt.laststatus = 2
opt.showtabline = 2

opt.visualbell = true
opt.errorbells = false

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.smartindent = true
opt.shiftwidth = 2
opt.softtabstop = 4
opt.tabstop = 4
opt.smarttab = true
-- opt.expandtab = true

opt.nrformats = {}

opt.completeopt = { "menuone" }

opt.clipboard = "unnamedplus"

opt.background = "dark"
