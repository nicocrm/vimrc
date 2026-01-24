require("config.lazy")

vim.cmd([[
	" Text, tab and indent related
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set backspace=indent,eol,start
	set expandtab
	set shiftwidth=2
	set tabstop=2
	set smarttab

	set linebreak   " break at sensible character
	set tw=500

	set autoindent
	set nosmartindent
	set wrap
  set nu
  set ignorecase smartcase
]])

-- Highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Persistent undo
local undo_path = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undo_path) == 0 then
  vim.fn.mkdir(undo_path, "p")
end
vim.opt.undodir = undo_path
vim.opt.undofile = true
-- write on :next
vim.opt.autowrite = true
