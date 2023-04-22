local isWindows = (vim.fn.has("win32") == 1)

local M = {
  "akinsho/toggleterm.nvim",
  commit = "19aad0f41f47affbba1274f05e3c067e6d718e1e",
  event = "VeryLazy",
}

function M.config()
  local status_ok, toggleterm = pcall(require, "toggleterm")
  if not status_ok then
    return
  end

  toggleterm.setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = isWindows and "pwsh" or "fish",
    float_opts = {
      border = "curved",
    },
  }

  function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  end

  vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

  function _LAZYGIT_TOGGLE()
    lazygit:toggle()
  end

  local pwsh = Terminal:new({ cmd = "pwsh", hidden = true })

  function _PWSH_TOGGLE()
  	pwsh:toggle()
  end

  local mingw64 = Terminal:new({
  	cmd = "C:/msys64/msys2_shell.cmd -defterm -here -no-start -use-full-path -mingw64 -shell fish",
  	hidden = true,
  })

  function _MINGW64_TOGGLE()
  	mingw64:toggle()
  end
end

return M
