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
]])

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
