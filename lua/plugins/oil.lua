return {
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<Esc>"] = "actions.close",
      },
    },
    keys = {
      { "<leader>o", "<cmd>Oil<cr>", desc = "Open parent directory in Oil" },
      {
        "<leader>O",
        function()
          require("oil").open(vim.fn.getcwd())
        end,
        desc = "Open Oil at project root",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
