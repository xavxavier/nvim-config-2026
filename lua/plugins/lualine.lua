return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		theme = "auto",
	},
	config = function()
		require("config.lualine_theme").setup()
	end,
}
