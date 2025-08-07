require("bufferline").setup({
	options = {
		-- keep your existing offsets…
		offsets                = {
			{
				filetype   = "NvimTree",
				text       = "Explorer",
				highlight  = "Directory",
				text_align = "left",
				padding    = 1,
			},
		},
		-- draw a thick line on either side of each buffer/tab
		separator_style        = "thick",
		enforce_regular_tabs   = true,
		always_show_bufferline = true,
	},
	highlights = {
		buffer_selected             = { bold = true },
		diagnostic_selected         = { bold = true },
		info_selected               = { bold = true },
		info_diagnostic_selected    = { bold = true },
		warning_selected            = { bold = true },
		warning_diagnostic_selected = { bold = true },
		error_selected              = { bold = true },
		error_diagnostic_selected   = { bold = true },
	},
})
