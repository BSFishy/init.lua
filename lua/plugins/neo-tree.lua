return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = true,
        },
        follow_current_file = {
          enabled = false,
          leave_dirs_open = true,
        },
      },
      buffers = {
        follow_current_file = {
          enabled = false,
          leave_dirs_open = true,
        },
      },
    },
  },
}
