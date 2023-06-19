return {
  {
    -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "PaterJason/cmp-conjure"
      }
    },
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the sources part of the options table
      table.insert(opts.sources, { name = "conjure" })

      -- return the new table to be used
      return opts
    end,
  },
}
