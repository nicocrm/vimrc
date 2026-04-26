return {
	{
		-- most git operations
		"NeogitOrg/neogit",
		lazy = true,
		opts = {
			mappings = {
				status = {
					["<c-d>"] = "PeekDown",
					["<c-u>"] = "PeekUp",
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim", -- required

			-- Only one of these is needed.
			-- "sindrets/diffview.nvim", -- optional -> clunky
			"esmuellert/codediff.nvim", -- optional (nicer, better key handling)
      -- toggle inline/sbs: t.  Toggle explorer: <leader>b.  Next/prev: ]f, ]c, [f, [c

			-- For a custom log pager
			"m00qek/baleia.nvim", -- optional

			-- Only one of these is needed.
			-- "nvim-telescope/telescope.nvim", -- optional
			-- "ibhagwan/fzf-lua", -- optional
			"nvim-mini/mini.pick", -- optional
			-- "folke/snacks.nvim", -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},
	{
		-- blame
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "]c", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Git hunk" },
			{ "[c", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous Git hunk" },
			{ "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
			{ "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
			{ "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
			{ "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle inline blame" },
      -- then <C-w>w to "go in" the popup, q to close
			{ "<leader>hb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
      -- open full blame view
			{ "<leader>hB", "<cmd>Gitsigns blame<cr>", desc = "Blame file" },
		},
	},
}
