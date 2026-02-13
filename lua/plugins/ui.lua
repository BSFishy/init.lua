return {
  -- pretty color scheme :3
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require('gruvbox').setup(opts)
      vim.cmd.colorscheme('gruvbox')
    end,
    --- @class GruvboxConfig
    opts = {
      overrides = {
        ["@variable"] = { link = "GruvboxBlue" },
        ["@namespace"] = { link = "GruvboxOrange" },
        ["@module"] = { link = "GruvboxOrange" },
        ["@type.qualifier"] = { link = "GruvboxRed" },

        -- plain @punctuation doesn't work, so I need to do it like this
        ["@punctuation.delimiter"] = { link = "GruvboxOrange" },
        ["@punctuation.bracket"] = { link = "GruvboxOrange" },
        ["@punctuation.special"] = { link = "GruvboxOrange" },

        ["@lsp.mod.format"] = { link = "GruvboxPurple" },
        ["@lsp.mod.global"] = { link = "GruvboxOrange" },
        ["@lsp.mod.defaultLibrary"] = { link = "GruvboxOrange" },
      },
    },
  },

  -- delimiters change color to indicate depth
  {
    {
      "HiPhish/rainbow-delimiters.nvim",
      config = function()
        vim.g.rainbow_delimiters = {
          priority = {
            [""] = 110,
          },
        }
      end,
    },
  },

  -- some snacks configuration
  {
    "snacks.nvim",
    opts = {
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false }, -- we set this in options.lua
      words = { enabled = true },
    },
    -- stylua: ignore
    keys = {
      { "<leader>n", function()
        if Snacks.config.picker and Snacks.config.picker.enabled then
          Snacks.picker.notifications()
        else
          Snacks.notifier.show_history()
        end
      end, desc = "Notification History" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    },
  },
}
