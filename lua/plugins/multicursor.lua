return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    local set = vim.keymap.set

    -- Match word under cursor (Like Ctrl+D in VS Code)
    set({ "n", "v" }, "<M-d>", function()
      mc.matchAddCursor(1)
    end)

    -- Clear all cursors with Escape
    set("n", "<Esc><Esc>", function()
      if mc.hasCursors() then
        mc.clearCursors()
      else
        vim.cmd("nohlsearch")
      end
    end)
  end,
}
