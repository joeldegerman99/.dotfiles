-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap




typescript.setup({
  server = {
    on_attach = function (client, buffnrj)
      keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
      keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
      keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
    end,
  },
})
