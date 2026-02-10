require("config.lazy")

-- Options
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smarttab = true
vim.opt.linebreak = true
vim.opt.textwidth = 500
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.wrap = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autowrite = true

-- Persistent undo
local undo_path = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undo_path) == 0 then
  vim.fn.mkdir(undo_path, "p")
end
vim.opt.undodir = undo_path
vim.opt.undofile = true

-- Key mappings
vim.keymap.set("i", "<M-C>", "<C-c>", { desc = "Hyper-C triggers Ctrl-C" , remap = true })
vim.keymap.set({ "n", "v", "o" }, "<leader>cf", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { silent = true, desc = "Copy relative path to clipboard (src/foo.txt)" })
vim.keymap.set("n", "<leader>cF", function()
  vim.fn.setreg("*", vim.fn.expand("%:p"))
end, { desc = "Copy absolute path to clipboard (/something/src/foo.txt)" })
vim.keymap.set("n", "<leader>ct", function()
  vim.fn.setreg("*", vim.fn.expand("%:t"))
end, { desc = "Copy filename to clipboard (foo.txt)" })
vim.keymap.set("n", "<leader>ch", function()
  vim.fn.setreg("*", vim.fn.expand("%:p:h"))
end, { desc = "Copy directory path to clipboard (/something/src)" })

-- Autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text briefly",
  callback = function()
    vim.highlight.on_yank()
  end,
})
