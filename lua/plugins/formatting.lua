return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Reformat on space + rf
			"<leader>rf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			javascript = { "prettier" },
			markdown = { "prettier" },
			yaml = { "prettier" },
		},
		-- Format on save?
		-- format_on_save = {
		-- 	timeout_ms = 500,
		-- 	lsp_format = "fallback",
		-- },
	},
}
