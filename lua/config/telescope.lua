-- lua/plugins/telescope.lua
local M = {}

function M.setup()
	local telescope = require('telescope')
	local builtin   = require('telescope.builtin')
	local themes    = require('telescope.themes')

	telescope.setup {
		-- your defaults, pickers, extensions…
		extensions = {
			['ui-select'] = { themes.get_dropdown() },
		},
	}

	-- load extensions
	pcall(telescope.load_extension, 'fzf')
	pcall(telescope.load_extension, 'ui-select')

	-- keymaps
	vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch [h]elp' })
	vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[s]earch [k]eymaps' })
	vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[s]earch [f]iles' })
	vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[s]earch [s]elect telescope' })
	vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[s]earch current [w]ord' })
	vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[s]earch by [g]rep' })
	vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[s]earch [d]iagnostics' })
	vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[s]earch [r]esume' })
	vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[s]earch recent files ("." for repeat)' })
	vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] find existing buffers' })

	-- advanced overrides
	vim.keymap.set('n', '<leader>/', function()
		builtin.current_buffer_fuzzy_find(themes.get_dropdown {
			winblend = 10,
			previewer = false,
		})
	end, { desc = '[/] fuzzily search in current buffer' })

	vim.keymap.set('n', '<leader>s/', function()
		builtin.live_grep {
			grep_open_files = true,
			prompt_title    = 'live grep in open files',
		}
	end, { desc = '[s]earch [/] in open files' })

	-- search your config
	vim.keymap.set('n', '<leader>sn', function()
		builtin.find_files { cwd = vim.fn.stdpath 'config' }
	end, { desc = '[s]earch [n]eovim files' })
end

return M
