-- https://github.com/nvim-mini/mini.nvim
return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.icons").setup()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.operators").setup()
		require("mini.completion").setup({
      -- don't fallback to builtin completion, I just want the LSP complete
      fallback_action = ""
    })
		require("mini.snippets").setup()

    -- Picker (alternative for fzf-lua)
    require("mini.pick").setup()
    vim.keymap.set("n", "<C-p>", "<cmd>Pick files<CR>", { desc = "Find files" })
		vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>", { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", "<cmd>Pick grep_live<CR>", { desc = "Live grep" })
		vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<CR>", { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>fh", "<cmd>Pick help<CR>", { desc = "Help tags" })
		vim.keymap.set("n", "<leader>fr", "<cmd>Pick resume<CR>", { desc = "Resume last picker" })
		vim.keymap.set("n", "<leader>/", "<cmd>Pick buf_lines<CR>", { desc = "Search in buffer" })

    -- File navigation (alternative for oil.vim)
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
    vim.keymap.set("n", "-", function() require("mini.files").open(vim.api.nvim_buf_get_name(0)) end, { 
      desc = "Open mini.files (current file)"
    })
    vim.keymap.set("n", "<leader>-", function() require("mini.files").open(".") end, {
      desc = "Open mini.files (current dir)"
    })
	end,
	lazy = false,
}
