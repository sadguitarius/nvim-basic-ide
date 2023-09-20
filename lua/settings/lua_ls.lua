return {
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
          [vim.fn.expand "$HOME/dev/lib/lua/LuaEnvironments"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
