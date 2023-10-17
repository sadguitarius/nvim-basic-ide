local mason_registry = require("mason-registry")

return {
  settings = {
    powershell_es = {
      bundle_path = mason_registry.get_package("powershell-editor-services"):get_install_path(),
    },
  },
}
