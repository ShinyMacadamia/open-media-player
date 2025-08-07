local map = vim.keymap.set
local opts = { noremap = true, silent = true }
--
map("i", "jk", "<ESC>")
map("n", "<C-s>", "<Cmd>w<CR>")
--
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--
local function smart_buf_close()
	-- 1) Grab the current buffer ID
	local cur_buf = vim.api.nvim_get_current_buf()

	-- 2) Switch to the previous buffer
	vim.cmd('bprevious')

	-- 3) Delete the original buffer by ID
	--    use bufdelete so it behaves like :bd (unloads, won't error if already hidden)
	vim.api.nvim_buf_delete(cur_buf, {})
end

map('n', '<leader>x', smart_buf_close, opts)
map('n', '<leader>X', '<Cmd>bw<CR>', opts)
map('n', '<A-9>', '<Cmd>bprevious<CR>', opts)
map('n', '<A-0>', '<Cmd>bnext<CR>', opts)
--
map('n', 'grr', '<Cmd>Trouble lsp_references<CR>', opts)
map('n', 'gri', '<Cmd>Trouble lsp_incoming_calls<CR>', opts)
map('n', 'gro', '<Cmd>Trouble lsp_outgoing_calls<CR>', opts)
map("n", "qr", function() require("trouble").close() end, { silent = true, desc = "Trouble: Close window" })
--
map("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go To Definition" })
map('n', '<leader>a', '<Cmd>AerialToggle<CR>', { noremap = true, silent = true, desc = "Aerial Toggle" })
--
map('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })
