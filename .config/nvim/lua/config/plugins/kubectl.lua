return {
	"ramilito/kubectl.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("kubectl").setup()
	end,
}
