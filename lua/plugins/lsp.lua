return {
  -- pre-packaged lsp configurations
  -- see https://github.com/neovim/nvim-lspconfig/tree/master/lsp
  -- the actual language server executables must be installed separately
  "neovim/nvim-lspconfig",
  config = function() 
    -- Python -> ty
    vim.lsp.enable('ty')
    vim.lsp.enable('dartls')
    vim.lsp.enable('angularls')
    vim.lsp.enable('tsserver')
    vim.lsp.enable('stylua')
    -- vim.lsp.config('pyrefly', {
    --   root_markers = { 'pyrefly.toml', '.git' },
    --   init_options = {
    --     -- this doesn't seem to actually work...
    --     displayTypeErrors = "force-on"
    --   }
    -- })
    -- vim.lsp.enable('pyrefly')

    -- useful keymappings
    vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
    vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, {})
  end
}
