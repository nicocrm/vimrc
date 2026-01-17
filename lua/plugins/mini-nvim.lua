-- https://github.com/nvim-mini/mini.nvim
return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.operators").setup()
		require("mini.completion").setup({
      -- don't fallback to builtin completion, I just want the LSP complete
      fallback_action = ""
    })
		require("mini.snippets").setup()
		require("mini.files").setup({
			mappings = {
				go_in_plus = "<CR>", -- Enter opens file/directory
				go_in = "l",
				go_out = "-",
			},
		})
		-- only load modules you use
	end,
	lazy = false,
	keys = {
		{
			"-",
			function()
				require("mini.files").open(vim.api.nvim_buf_get_name(0))
			end,
			desc = "Open mini.files (current file)",
		},
	},
}
