return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				terraform = { "terraform_fmt" }, -- Built-in to conform.nvim
				tf = { "terraform_fmt" },
				["terraform-vars"] = { "terraform_fmt" },
				dockerfile = { "prettier" },
				yaml = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				toml = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
