return {
	"echasnovski/mini.statusline",
	version = false,
	config = function()
		local statusline = require("mini.statusline")

		-- Custom active statusline
		local function my_active()
			local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
			local git = statusline.section_git({ trunc_width = 75 })
			local diagnostics = statusline.section_diagnostics({
				trunc_width = 75,
				signs = { ERROR = "✘", WARN = "▲", INFO = "●", HINT = "?" },
			})
			local filename = statusline.section_filename({ trunc_width = 140 })
			local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
			local location = statusline.section_location({ trunc_width = 75 })
			local search = statusline.section_searchcount({ trunc_width = 75 })

			return statusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
				"%<", -- Mark general truncate point
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { search, location } },
			})
		end

		statusline.setup({
			content = {
				active = my_active,
				inactive = nil,
			},
			use_icons = true,
			set_vim_settings = true,
		})

		-- Material Deep Ocean colors
		vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#0f111a", bg = "#8f9aae", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = "#0f111a", bg = "#82aaff", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = "#0f111a", bg = "#c792ea", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = "#0f111a", bg = "#f07178", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = "#0f111a", bg = "#ffcb6b", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { fg = "#8f9aae", bg = "#1e2030" })
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#c3e88d", bg = "#1e2030" })
		vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { fg = "#8f9aae", bg = "#1e2030" })
		vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { fg = "#717cb4", bg = "#1e2030" })
	end,
}
