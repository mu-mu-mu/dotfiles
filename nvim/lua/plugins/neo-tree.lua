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
		window = {
		  fuzzy_finder_mappings = {
			["<C-t>"] = function(state)
			  require("neo-tree.sources.filesystem.commands").open_tabnew(state)
			end,
		  },
		},
      },
      window = {
        width = 30,
      },
    },
  },
}
