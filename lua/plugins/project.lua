if true then return {} end
return {
  "ahmedkhalf/project.nvim",
  opts = {
    manual_mode = false,
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "Makefile", "package.json" },
  },
}
