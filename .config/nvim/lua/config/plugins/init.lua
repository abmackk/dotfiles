require("lazy").setup({
	require("config.plugins.theme"),
	require("config.plugins.treesitter"),
	require("config.plugins.ministatus"),
	require("config.plugins.dashboard"),
	require("config.plugins.telescope"), -- Back to optimized Telescope
	require("config.plugins.harpoon"),
	require("config.plugins.copilot"),
	require("config.plugins.mason"),
	require("config.plugins.lsp"),
	require("config.plugins.formatting"),
	require("config.plugins.linting"),
	require("config.plugins.dap"),
	require("config.plugins.cmp"),
	require("config.plugins.oil"),
	require("config.plugins.gitsigns"),
	require("config.plugins.whichkey"),
	require("config.plugins.comment"),
	require("config.plugins.autopairs"),
	require("config.plugins.flash"),
	require("config.plugins.todo"),
	require("config.plugins.surround"),
	require("config.plugins.trouble"),
	require("config.plugins.lazygit"),
	require("config.plugins.miniai"),
	require("config.plugins.colorizer"),
	require("config.plugins.yaml"), -- YAML tools
	require("config.plugins.toggleterm"), -- Better terminal
	require("config.plugins.markdown"), -- Markdown preview
	require("config.plugins.kubectl"), -- Kubernetes management
	require("config.plugins.sessions"), -- Session management
	require("config.plugins.vimbegood"), -- Vim-Motion Game
})
