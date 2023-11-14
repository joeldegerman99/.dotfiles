return {
  "NvChad/nvterm",
  config = function()
      local powershell_options = {
        shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
        shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
      }

    for option, value in pairs(powershell_options) do
      vim.opt[option] = value
    end
    require("nvterm").setup()

    local terminal = require("nvterm.terminal")

    local toggle_modes = { "n", "t" }
    local mappings = {
      {
        toggle_modes,
        "<A-h>",
        function()
          terminal.toggle("horizontal")
        end,
      },
      {
        toggle_modes,
        "<A-v>",
        function()
          terminal.toggle("vertical")
        end,
      },
      {
        toggle_modes,
        "<A-i>",
        function()
          terminal.toggle("float")
        end,
      },
    }
    local opts = { noremap = true, silent = true }
    for _, mapping in ipairs(mappings) do
      vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
    end
  end,
}
