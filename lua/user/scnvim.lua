local M = {
  "davidgranstrom/scnvim",
  event = "VimEnter",
}

function M.config()
  local status_ok, scnvim = pcall(require, "scnvim")
  if not status_ok then
    return
  end

  local map = scnvim.map
  local map_expr = scnvim.map_expr

  local isWindows = (vim.fn.has "win32" == 1)
  local scnvim_cmd = isWindows and "C:/Program Files/SuperCollider-3.13.0/sclang.exe" or "sclang"

  scnvim.setup {
    ensure_installed = true,
    sclang = {
      cmd = scnvim_cmd,
      args = {},
    },
    keymaps = {
      ["<M-e>"] = map("editor.send_line", { "i", "n" }),
      ["<C-e>"] = {
        map("editor.send_block", { "i", "n" }),
        map("editor.send_selection", "x"),
      },
      ["<CR>"] = map "postwin.toggle",
      ["<M-CR>"] = map("postwin.toggle", "i"),
      ["<M-L>"] = map("postwin.clear", { "n", "i" }),
      ["<C-k>"] = map("signature.show", { "n", "i" }),
      ["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
      ["<leader>st"] = map "sclang.start",
      ["<leader>sk"] = map "sclang.recompile",
      ["<F1>"] = map_expr "s.boot",
      ["<F2>"] = map_expr "s.meter",
    },
    documentation = {
      cmd = isWindows and "C:\\Users\\sadguitarius\\scoop\\shims\\pandoc.exe" or "pandoc",
      horizontal = true,
      direction = "top",
      keymaps = true,
    },
    postwin = {
      highlight = true,
      auto_toggle_error = true,
      scrollback = 5000,
      horizontal = false,
      direction = "right",
      size = nil,
      fixed_size = nil,
      keymaps = nil,
      float = {
        enabled = true,
        row = 0,
        col = function()
          return vim.o.columns
        end,
        width = 64,
        height = 14,
        config = {
          border = "rounded",
        },
        callback = function(id)
          vim.api.nvim_win_set_option(id, "winblend", 10)
        end,
      },
    },
    editor = {
      force_ft_supercollider = true,
      highlight = {
        color = "TermCursor",
        type = "flash",
        flash = {
          duration = 100,
          repeats = 2,
        },
        fade = {
          duration = 375,
        },
      },
      signature = {
        float = true,
        auto = true,
      },
    },
    snippet = {
      engine = {
        name = "luasnip",
        options = {
          descriptions = true,
        },
      },
    },
    statusline = {
      poll_interval = 1,
    },
    extensions = {},
  }

  require("scnvim.postwin").on_open:append(function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.showbreak = ".."
  end)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "supercollider",
    callback = function()
      vim.bo.tabstop = 4
      vim.bo.softtabstop = 4
      vim.bo.shiftwidth = 4
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "help.supercollider",
    callback = function()
      vim.bo.bufhidden = "delete"
    end,
  })

  -- UNCOMMENT IF SNIPPETS DON'T WORK
  require("luasnip").add_snippets("supercollider", require("scnvim/utils").get_snippets())
end

return M
