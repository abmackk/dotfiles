return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/persistence.nvim",
	},
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{
						desc = " Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Recent",
						group = "Number",
						action = "Telescope oldfiles",
						key = "r",
					},
					{
						desc = " Grep",
						group = "DiagnosticHint",
						action = "Telescope live_grep",
						key = "g",
					},
					{
						desc = " Restore Session",
						group = "@property",
						action = "lua require('persistence').load()",
						key = "s",
					},
					{
						desc = " Config",
						group = "DiagnosticWarn",
						action = "e ~/.config/nvim",
						key = "c",
					},
					{
						desc = " Lazy",
						group = "String",
						action = "Lazy",
						key = "l",
					},
					{
						desc = " Quit",
						group = "Error",
						action = "qa",
						key = "q",
					},
				},
				project = {
					enable = true,
					limit = 5,
					icon = "󰏓 ",
					label = " Recent Projects",
					action = "Telescope find_files cwd=",
				},
				mru = {
					limit = 10,
					icon = " ",
					label = " Recent Files",
					cwd_only = false,
				},
				footer = { "", "~ Abhilash" },
			},
		})
	end,
}
