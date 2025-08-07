-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "qf", "help", "man", "lspinfo" },
-- 	callback = function()
-- 		local bufnr = vim.api.nvim_get_current_buf()
-- 		-- only float if it’s not already in a float
-- 		if vim.api.nvim_win_get_config(0).relative == "" then
-- 			vim.api.nvim_open_win(bufnr, true, {
-- 				relative = "editor",
-- 				style    = "minimal",
-- 				border   = "rounded",
-- 				width    = math.floor(vim.o.columns * 0.6),
-- 				height   = math.floor(vim.o.lines * 0.5),
-- 				row      = 2,
-- 				col      = math.floor(vim.o.columns * 0.2),
-- 			})
-- 		end
-- 	end,
-- })

vim.opt.fillchars:append {
	eob = " ", -- end-of-buffer lines (the “~”s)
	vert = "│", -- vertical separators
	fold = " ", -- folded lines
}
