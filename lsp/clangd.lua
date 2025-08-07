return {
  cmd = {
    "clangd",
    "--function-arg-placeholders=false",
    "--completion-style=bundled",
    "--pch-storage=memory",
    "--background-index",
    "--background-index-priority=normal",
  },
  filetypes = { 'c', 'cpp' },
  root_markers = { '.clangd', 'compile_commands.json' },
}
