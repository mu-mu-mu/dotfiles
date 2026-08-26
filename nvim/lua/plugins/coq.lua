return {
  {
    "whonore/Coqtail",
    lazy = false,
    init = function()
      vim.g.loaded_coqtail = 1
      vim.g.coqtail_supported = 1
      vim.g["coqtail#supported"] = 0
      vim.g.coqtail_nomap = 1
    end,
  },

--  {
--    "tomtomjhj/coq-lsp.nvim",
--    enabled = false,
--    ft = { "coq" },
--    dependencies = {
--      "neovim/nvim-lspconfig",
--      "whonore/Coqtail",
--    },
--    keys = {
--      { "<leader>ci", "<cmd>CoqLsp open_info_panel<CR>", ft = "coq", desc = "Open Coq LSP info panel" },
--      { "<leader>cv", "<cmd>CoqLsp saveVo<CR>", ft = "coq", desc = "Save Coq .vo file" },
--    },
--    config = function()
--      local capabilities
--      local ok, blink = pcall(require, "blink.cmp")
--      if ok then
--        capabilities = blink.get_lsp_capabilities()
--      end
--
--      require("coq-lsp").setup({
--        coq_lsp_nvim = {
--          info_panel_mode = "tab",
--          info_panel_sticky_close = true,
--        },
--        lsp = {
--          autostart = false,
--          capabilities = capabilities,
--          init_options = {
--            show_notices_as_diagnostics = true,
--          },
--        },
--      })
--    end,
--  },
}
