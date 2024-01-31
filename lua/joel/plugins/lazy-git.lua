return {
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>lg", ":LazyGit<CR>",{ desc = "Format file or range (in visual mode)" })
    end,
  },
}
