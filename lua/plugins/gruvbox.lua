return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    --- @class GruvboxConfig
    opts = {
      overrides = {
        ["@variable"] = { link = "GruvboxBlue" },
        ["@namespace"] = { link = "GruvboxOrange" },
        ["@type.qualifier"] = { link = "GruvboxRed" },

        -- plain @punctuation doesn't work, so I need to do it like this
        ["@punctuation.delimiter"] = { link = "GruvboxOrange" },
        ["@punctuation.bracket"] = { link = "GruvboxOrange" },
        ["@punctuation.special"] = { link = "GruvboxOrange" },
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
