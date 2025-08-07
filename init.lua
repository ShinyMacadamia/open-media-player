require("config.lazy")
require("config.user_commands")
require("config.keymaps")
require("config.colors")
require("config.telescope").setup()
require("config.noice")
require("config.bufferline")
require("config.nvim-tree")
require("config.borders")

vim.opt.number = true

vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')

vim.diagnostic.config({
	virtual_lines = true
})
vim.cmd("set completeopt+=noselect")
vim.o.winborder = 'rounded'
-- vim.cmd("colorscheme tokyodark")
-- vim.cmd("colorscheme cyberdream")
-- vim.g.material_style = "oceanic"
-- vim.cmd 'colorscheme material'

vim.opt.termguicolors = true
