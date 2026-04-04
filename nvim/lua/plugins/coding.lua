return {
  -- -- LSP
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     local lspconfig = require("lspconfig")
  --
  --   end,
  -- },

  -- snippet engine
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- completion
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        preset = "default",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<CR>"] = { "accept", "fallback" },
        -- ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        -- ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			  
		["<C-n>"] = { "select_next" },
		["<C-p>"] = { "select_prev" },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
      },
      completion = {
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      snippets = { preset = "luasnip" },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },

  -- GitHub Copilot (official)
  {
    "github/copilot.vim",
    init = function()
      vim.g.copilot_no_tab_map = true
      -- vim.keymap.set("i", "<C-l>", 'copilot#Accept("\\<CR>")', {
      --   expr = true,
      --   replace_keycodes = false,
      --   silent = true,
      -- })
      vim.keymap.set(
        "i",
        "<Tab>",
        'pumvisible() ? "\\<C-n>" : copilot#Accept("\\<Tab>")',
        { expr = true, replace_keycodes = false }
      )
    end,
  },
}
