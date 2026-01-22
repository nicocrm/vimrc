-- Plugins related to motion and text objects
return {
  {
    -- replaces vim word motions with "smarter" ones
    "chrisgrieser/nvim-spider",
    keys = {
      -- will need to use "ce" to change just the current word - cw will change all the way to the next one
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
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

