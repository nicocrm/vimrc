return {
  -- pre-packaged lsp configurations
  -- see https://github.com/neovim/nvim-lspconfig/tree/master/lsp
  -- the actual language server executables must be installed separately
  "neovim/nvim-lspconfig",
  config = function() 
    -- Python -> ty
    vim.lsp.enable('ty')
    -- vim.lsp.config('pyrefly', {
    --   root_markers = { 'pyrefly.toml', '.git' },
    --   init_options = {
    --     -- this doesn't seem to actually work...
    --     displayTypeErrors = "force-on"
    --   }
    -- })
    -- vim.lsp.enable('pyrefly')
  end
}
