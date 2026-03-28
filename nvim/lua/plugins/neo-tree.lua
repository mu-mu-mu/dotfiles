return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<C-e>", "<cmd>Neotree toggle left<CR>", desc = "Toggle file tree" },
    },
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
      window = {
        width = 30,
      },
    },
  },
}
