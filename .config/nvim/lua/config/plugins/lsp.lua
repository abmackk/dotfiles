return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Configure LSP keybindings on attach
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local opts = { buffer = event.buf, silent = true }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end,
		})

		-- Configure each LSP server
		-- Lua
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		})

		-- Bash
		vim.lsp.config("bashls", {
			capabilities = capabilities,
		})

		-- Terraform
		vim.lsp.config("terraformls", {
			capabilities = capabilities,
		})

		-- Docker
		vim.lsp.config("dockerls", {
			capabilities = capabilities,
		})

		-- YAML
		vim.lsp.config("yamlls", {
			capabilities = capabilities,
			settings = {
				yaml = {
					schemas = {
						kubernetes = "*.yaml",
					},
				},
			},
		})

		-- HTML
		vim.lsp.config("html", {
			capabilities = capabilities,
		})

		-- CSS
		vim.lsp.config("cssls", {
			capabilities = capabilities,
		})

		-- Enable all configured LSP servers
		vim.lsp.enable({
			"lua_ls",
			"bashls",
			"terraformls",
			"dockerls",
			"yamlls",
			"html",
			"cssls",
			"dockerls", -- Docker LSP
			"docker_compose_language_service", -- Docker Compose LSP
		})
	end,
}
