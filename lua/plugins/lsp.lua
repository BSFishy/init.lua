return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- remove proto
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
        -- configure protols
        protols = {
          filetypes = { "proto" },
        },
        lua_ls = {
          mason = false,
        },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
