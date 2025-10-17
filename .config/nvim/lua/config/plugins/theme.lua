return {
	-- Material Deep Ocean (your main theme)
	{
		"marko-cerovac/material.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("material").setup({
				contrast = {
					terminal = false,
					sidebars = false,
					floating_windows = false,
					cursor_line = false,
					non_current_windows = false,
					filetypes = {},
				},
				styles = {
					comments = { italic = true },
					strings = {},
					keywords = {},
					functions = {},
					variables = {},
					operators = {},
					types = {},
				},
				plugins = {
					"gitsigns",
					"harpoon",
					"nvim-cmp",
					"nvim-web-devicons",
					"telescope",
					"trouble",
					"which-key",
				},
				disable = {
					colored_cursor = false,
					borders = false,
					background = true,
					term_colors = false,
					eob_lines = false,
				},
				high_visibility = {
					lighter = false,
					darker = false,
				},
				lualine_style = "default",
				async_loading = true,
			})
			vim.g.material_style = "deep ocean"
			vim.cmd("colorscheme material")
		end,
	},

	-- Vague.nvim (minimal alternative)
	{
		"vague2k/vague.nvim",
		lazy = true,
		config = function()
			require("vague").setup({
				transparent = false,
				style = {
					comments = "italic",
					keywords = "bold",
					functions = "none",
					variables = "none",
				},
			})
		end,
	},
}
