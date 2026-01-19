return {
  "ibhagwan/fzf-lua", 
  dependencies = { "nvim-mini/mini.icons" },
  keys = {
    { "<C-p>", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Find files" },
    -- Optional additional mappings:
    { "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>", desc = "Live grep" },
    { "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>lua require('fzf-lua').help_tags()<CR>", desc = "Help tags" },
  },
}
