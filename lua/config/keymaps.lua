-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map({ "n", "i", "o" }, "<HOME>", function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local first_non_char_col = function()
    return vim.api.nvim_get_current_line():find("%S") - 1
  end
  if col == 0 or col > first_non_char_col() then
    vim.cmd("norm _")
  else
    vim.cmd("norm 0")
  end
end)

-- Terminal
map("t", "<ESC>", "<C-\\><C-n>")
map("t", "<leader>`", "<C-\\><C-n><C-w>p")
map("t", "<C-d>", "<cmd>:bd!<cr>")
map("n", "<leader>tv", "<C-w><C-v><cmd>term<cr>i")
map("n", "<leader>ts", "<C-w><C-s><cmd>term<cr>i")

local dap = require("dap")

dap.listeners.before.launch.test = function()
  print("entrando....")
end

dap.listeners.before.launch.set_keymaps = function()
  vim.keymap.set("n", "<M-Right>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
  vim.keymap.set("n", "<M-Down>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
  vim.keymap.set("n", "<M-Up>", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
end
dap.listeners.before.event_terminated.set_keymaps = function()
  vim.keymap.del("n", "<M-Right>")
  vim.keymap.del("n", "<M-Down>")
  vim.keymap.del("n", "<M-Up>")
end
-- dap.listeners.before.event_exited.set_keymaps = dap.listeners.before.event_terminated.set_keymaps

map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
  "n",
  "<leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
map("n", "<leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger terminate" })
map("n", "<leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- map("t", "<leader>w", "<C-\\><C-n><C-w><C-w>")
-- map("n", "<leader>tv", "<C-w><C-v><cmd>term<cr>i")

map({ "i", "v" }, "<M-Up>", "<Esc><Cmd>m .-2<CR>==gi")
map({ "i", "v" }, "<M-Down>", "<Esc><Cmd>m .+1<CR>==gi")
