local M = {
  "madskjeldgaard/faust-nvim",
  event = "VimEnter",
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
