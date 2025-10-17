return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			"*", -- Highlight all files
			css = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- "Name" codes like Blue, red
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features
				css_fn = true, -- Enable all CSS *functions*
			},
		}, {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = false, -- "Name" codes like Blue (disable for non-CSS)
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			rgb_fn = true, -- rgb() and rgba() functions
			hsl_fn = true, -- hsl() and hsla() functions
		})
	end,
}
