-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Create a dedicated augroup to manage the terminal autocommands and prevent duplicates
local term_auto_group = vim.api.nvim_create_augroup("TermInsertModeGroup", { clear = true })

-- Autocmd to enter insert mode when a terminal is opened or entered
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  group = term_auto_group,
  pattern = { "*" },
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      -- Use vim.schedule to ensure the command runs after Neovim has finished processing the event
      vim.schedule(function()
        vim.cmd(":startinsert")
      end)
    end
  end,
  desc = "Automatically enter insert mode in terminal buffers",
})
