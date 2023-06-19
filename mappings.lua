-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["s"] = { "<cmd> HopWord<CR>", desc = "Hop by word" },
    ["S"] = { "<cmd> HopChar1<CR>", desc = "Hop by word" },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    ["<localleader>r"] = { name = "Run" },
    ["<localleader>rf"] = {
      function()
        local file_path = vim.fn.expand('%')
        local Terminal = require("toggleterm.terminal").Terminal
        local cmd = "mix run " .. file_path
        local mix = Terminal:new({
          cmd = cmd,
          hidden = true,
          direction = "float",
          close_on_exit = false
        })
        mix:open()
      end,
      desc = "Run file with mix"
    }
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
