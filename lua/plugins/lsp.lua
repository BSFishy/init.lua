return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- remove proto
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
          mason = false,
        },
        -- configure protols
        protols = {
          filetypes = { "proto" },
        },
        lua_ls = {
          mason = false,
        },
        helm_ls = {
          mason = false,
        },
        stylua = {
          mason = false,
        },
        ruff = {
          mason = false,
        },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
