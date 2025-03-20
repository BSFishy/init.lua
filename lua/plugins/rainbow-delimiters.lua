return {
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
}
