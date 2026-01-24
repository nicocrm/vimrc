-- Plugins related to motion and text objects
return {
  {
    -- replaces vim word motions with "smarter" ones
    "chrisgrieser/nvim-spider",
    keys = {
      -- use meta modifier, because remapping the standard keys makes it difficult to navigate on a vi
      -- instance that does not have the plugin
      { "<M-w>", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "<M-e>", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "<M-b>", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
      { "<M-g><M-e>", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
    },
  }, {
    -- 
    {
      "chrisgrieser/nvim-various-textobjs",
      -- there are many more, which I have not enabled right now... see https://github.com/chrisgrieser/nvim-various-textobjs
      -- we could get some of that functionality with mini.ai but there were many edge cases not handled correctly
      keys = {
        { "is", '<cmd>lua require("various-textobjs").subword("inner")<CR>', mode = { "o", "x" } },
        { "as", '<cmd>lua require("various-textobjs").subword("outer")<CR>', mode = { "o", "x" } },
      },
    },
  }
}

