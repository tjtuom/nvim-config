return function()
  -- need to do this here so that id doesn't get overridden by plugins
  local keywordGroup = vim.api.nvim_create_augroup("fix-iskeyword", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "clojure",
    callback = function()
      vim.opt.iskeyword = "@,48-57,_,-"
    end,
    group = keywordGroup
  })
end
