return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		_Gopts = {
			position = "center",
			hl = "Type",
			wrap = "overflow",
		}

		local function load_random_header()
			math.randomseed(os.time())
			local header_folder = vim.fn.stdpath("config") .. "/lua/plugins/header_img/"
			local files = vim.fn.globpath(header_folder, "*.lua", true, true)
			if #files == 0 then
				return nil
			end
			local random_file = files[math.random(#files)]
			local module_name = "plugins.header_img." .. random_file:match("([^/]+)%.lua$")
			return require(module_name).header
		end

		-- Inicjalne załadowanie nagłówka
		local header = load_random_header()
		if header then
			dashboard.config.layout[2] = header
		else
			print("Brak plików nagłówków w folderze header_img.")
		end

		dashboard.section.buttons.val = {
			dashboard.button("p", "  Projects", ":e $HOME/code <CR>"),
			dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy update<CR>"),
			dashboard.button("c", "  Settings", ":e $HOME/.config/nvim/init.lua<CR>"),
		}

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			desc = "Add Alpha dashboard footer",
			once = true,
			callback = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
				dashboard.section.footer.val =
					{ " ", " ", " ", " Loaded " .. stats.count .. " plugins  in " .. ms .. " ms " }
				dashboard.section.header.opts.hl = "DashboardFooter"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
