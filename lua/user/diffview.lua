local M = {
  "sindrets/diffview.nvim",
  event = "VimEnter",
}

function M.config()
  require("diffview").setup {
    enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
  }
end

return M
