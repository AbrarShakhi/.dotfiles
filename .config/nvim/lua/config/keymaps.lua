-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function show_arrow_hint(key)
  return function()
    vim.notify("Use " .. key .. " movement (hjkl)", vim.log.levels.INFO, { timeout = 1500 })
  end
end

-- Normal
map("n", "<Up>", show_arrow_hint("Up"), opts)
map("n", "<Down>", show_arrow_hint("Down"), opts)
map("n", "<Left>", show_arrow_hint("Left"), opts)
map("n", "<Right>", show_arrow_hint("Right"), opts)

-- map("i", "<Up>", "<Nop>", opts)
-- map("i", "<Down>", "<Nop>", opts)
-- map("i", "<Left>", "<Nop>", opts)
-- map("i", "<Right>", "<Nop>", opts)

-- Visual
map("v", "<Up>", show_arrow_hint("Up"), opts)
map("v", "<Down>", show_arrow_hint("Down"), opts)
map("v", "<Left>", show_arrow_hint("Left"), opts)
map("v", "<Right>", show_arrow_hint("Right"), opts)
