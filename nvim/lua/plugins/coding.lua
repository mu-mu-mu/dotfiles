return {
  -- -- LSP
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     local lspconfig = require("lspconfig")
  --
  --   end,
  -- },

--  -- snippet engine
--  {
--    "L3MON4D3/LuaSnip",
--    dependencies = { "rafamadriz/friendly-snippets" },
--    config = function()
--      require("luasnip.loaders.from_vscode").lazy_load()
--    end,
--  },

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

  -- formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" },
        desc = "Format buffer/range",
      },
    },
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
      },
      formatters = {
        rustfmt = {
          args = { "--edition", "2021", "--config", "unstable_features=true" },
        },
      },
    },
    config = function(_, opts)
      local conform = require("conform")
      conform.setup(opts)

      vim.keymap.set({ "n", "v" }, "gq", function()
        conform.format({ async = true, lsp_fallback = true })
      end, { desc = "Format with rustfmt" })
    end,
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
	  vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-word)")
	  vim.keymap.set("i", "<C-j>", "<Plug>(copilot-accept-line)")
	  vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)")
	  vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)")
    end,
  },
}
