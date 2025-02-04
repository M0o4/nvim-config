return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim", "folke/todo-comments.nvim" },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "package-lock.json",
          "pnpm-lock.yaml",
        },
      },
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep finding" })
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find references" })
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
