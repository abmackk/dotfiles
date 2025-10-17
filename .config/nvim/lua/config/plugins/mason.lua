return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"bashls",
				"terraformls",
				"dockerls",
				"yamlls",
				"html",
				"cssls",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Formatters
				"stylua", -- Lua
				"shfmt", -- Bash/Shell
				"prettier", -- HTML, CSS, YAML

				-- Linters
				"shellcheck", -- Bash/Shell
				"tflint", -- Terraform
				"hadolint", -- Docker
				"yamllint", -- YAML
				"htmlhint", -- HTML
				"stylelint", -- CSS

				-- DAP
				"bash-debug-adapter",
			},
		})
	end,
}
