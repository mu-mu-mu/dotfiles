return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "wombat",
        globalstatus = false,
      },
      extensions = {
        "neo-tree",
      },
    },
  },
}
