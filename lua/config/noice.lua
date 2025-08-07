require('noice').setup({
	lsp = {
		override = {
			["vim.lsp.util.stylize_markdown"] = true,
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
		},
		signature = {
			enabled = false,
			auto_open = { enabled = false },
		},
	},
	routes = {
		{
			filter = { event = "notify", find = "No information available" },
			opts = { skip = true },
		},
	},
	presets = {
		lsp_doc_border = true,
	},
})
