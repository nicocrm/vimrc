return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.install({
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "go",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "python",
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'java', 'c', 'lua', 'vim', 'vimdoc', 'query', 'go', 'python', 'javascript', 'typescript', 'html', 'yaml' },
      callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim (I don't like folds)
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
