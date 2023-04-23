local M = {
  "madskjeldgaard/faust-nvim",
  ft = "faust",
	dependencies = {
    {
	    "vijaymarupudi/nvim-fzf",
      lazy=true
    },
    {
	    "L3MON4D3/LuaSnip",
      lazy=true
    }
	}
}

function M.config()
  local isWindows = (vim.fn.has "win32" == 1)
  if isWindows then
    return
  end

  local status_ok, faust = pcall(require, "faust-nvim")
  if not status_ok then
    return
  end

  faust.load_snippets()
end

return M
