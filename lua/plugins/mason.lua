return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      for i=#opts.ensure_installed,1,-1 do
        if opts.ensure_installed[i] == "stylua" then
          table.remove(opts.ensure_installed, i)
        end
      end
    end
  }
}
