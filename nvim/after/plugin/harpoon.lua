local mark_status, mark = pcall(require, "harpoon.mark")
local ui_status, ui = pcall(require, "harpoon.ui")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

if not mark_status then
	return
end

if not ui_status then
	return
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-t>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<C-n>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<C-s>", function()
	ui.nav_file(4)
end)
