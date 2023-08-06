local setup_builtin, builtin = pcall(require, "telescope.builtin")
if not setup_builtin then
	return
end

local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
			},
			["ui-select"] = {
				specific_opts = {
					codeactions = false,
				},
			},
		},
	},
})
require("telescope").load_extension("fzy_native")

require("telescope").load_extension("ui-select")
