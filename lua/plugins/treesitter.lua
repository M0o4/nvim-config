return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "hiphish/rainbow-delimiters.nvim",
  },
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "angular", "scss" })
    end
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      pattern = { "*.component.html", "*.container.html", "*.template.html" },
      callback = function()
        vim.treesitter.start(nil, "angular")
      end,
    })
  end,
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
        "tsx",
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
