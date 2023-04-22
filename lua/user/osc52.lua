local M = {
  "ojroques/nvim-osc52",
  event = "Bufenter"
}

function M.config()
  local status_ok, osc52 = pcall(require, "osc52")
  if not status_ok then
    return
  end

  osc52.setup {
    max_length = 0,      -- Maximum length of selection (0 for no limit)
    silent     = false,  -- Disable message on successful copy
    trim       = false,  -- Trim surrounding whitespaces before copy
  }

	vim.keymap.set("n", "<leader>c", osc52.copy_operator, { expr = true })
	vim.keymap.set("n", "<leader>cc", "<leader>c_", { remap = true })
	vim.keymap.set("x", "<leader>c", osc52.copy_visual)
end

return M
