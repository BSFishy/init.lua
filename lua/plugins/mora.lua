-- disable this for now
if true then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.mora = {
        install_info = {
          url = vim.fn.stdpath("config") .. "/grammars/tree-sitter-mora",
          files = { "src/parser.c" },
          generate_requires_npm = false,
          requires_generate_from_grammar = true,
        },
        filetype = "mora",
      }

      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "mora" })
    end,
  },
}
