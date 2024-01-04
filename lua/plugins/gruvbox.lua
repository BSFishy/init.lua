-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
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
        ["@punctuation.delimiter"] = { link = "GruvboxOrange" },
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
