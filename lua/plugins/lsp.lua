return {
  -- pre-packaged lsp configurations
  -- see https://github.com/neovim/nvim-lspconfig/tree/master/lsp
  -- the actual language server executables must be installed separately
  "neovim/nvim-lspconfig",
  config = function() 
    -- Python -> ty
    vim.lsp.enable('ty')
  end
}
