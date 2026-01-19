-- https://github.com/nvim-mini/mini.nvim
return {
	"nvim-mini/mini.files",
	version = false,
  config = function()
    require("mini.files").setup({
      mappings = {
        go_in_plus = "<CR>", -- Enter opens file/directory
        go_in = "l",
        go_out = "-",
      },
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesWindowUpdate",
      callback = function(args)
        local win_id = args.data.win_id

        -- Set options specifically for the mini.files window
        vim.wo[win_id].number = true
        vim.wo[win_id].relativenumber = true
      end,
    })
  end,
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
--
-- Oil
--
-- Cheat sheet:
-- Open with "-"
-- Navigate as Vim buffer (use C-o to jump back)
-- Close with C-c
-- return {
--   "stevearc/oil.nvim",
--   dependencies = { { "nvim-mini/mini.icons", opts = {} } },
--   lazy = false,
--   opts = {
--
--   },
--   keys = {
-- 	  {
-- 		  "-", "<cmd>Oil<CR>", desc = "Open parent directory"
-- 	  },
--     {
--       "<leader>-", "<cmd>Oil .<CR>", desc = "Open current working directory"
--     }
--   }
-- }
