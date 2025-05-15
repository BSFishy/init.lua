local detail = false

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
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
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
