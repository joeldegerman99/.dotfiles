
local status, nvim_tree = pcall(require ,"nvim-tree")
if not status then
  return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


nvim_tree.setup()
