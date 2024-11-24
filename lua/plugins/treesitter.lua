return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = {
				"lua",
				"javascript",
				"html",
				"c",
				"c_sharp",
				"cpp",
				"css",
				"dockerfile",
				"gitignore",
				"nginx",
				"typescript",
				"json",
				"angular",
				"scss",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
