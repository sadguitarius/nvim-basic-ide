local M = {}

M.servers = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "vimls",
  "clangd",
  "rust_analyzer",
  "neocmake",
--  "julials",
}

if vim.fn.has("win32") == 1 then
  table.insert(M.servers, "powershell_es")
end

return M
