return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"hiphish/rainbow-delimiters.nvim",
	},
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
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}
