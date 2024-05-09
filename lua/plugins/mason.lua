return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "gopls",
        "nil",
        "nixpkgs-fmt",
        "svelte-language-server",
      })
    end,
  },
}
