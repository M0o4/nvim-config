return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "angularls", "html", "ts_ls", "cssls", "tailwindcss" },
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- Angular
			local project_library_path =
				"/Users/reygrau/.nvm/versions/node/v20.15.0/lib/node_modules/@angular/language-server"
			local cmd = {
				"ngserver",
				"--stdio",
				"--tsProbeLocations",
				"./node_modules/typescript/lib/tsserverlibrary",
				"--ngProbeLocations",
				project_library_path,
			}
			lspconfig.angularls.setup({
				cmd = cmd,
				capabilities = capabilities,
				on_new_config = function(new_config)
					new_config.cmd = cmd
				end,
			})
			-- Angular

			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
				settings = {
					css = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
					scss = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
					less = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				settings = {
					tailwindCSS = {
						classAttributes = {
							"class",
							"className",
							"ngClass",
							"style",
							"classNames",
						},
						experimental = {
							classRegex = {
								-- Matches any key inside `classNames={{ key: 'some classes' }}`
								{ "classNames%s*=%s*{[^}]*([%w_]+):%s*'([^']*)'", "[\"']([^\"']*)[\"']" },
							},
						},
					},
				},
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
      -- lspconfig.bacon_ls.setup({ capabilities =capabilities})
		end,
	},
}
