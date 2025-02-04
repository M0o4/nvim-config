vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("language en_US")
vim.g.mapleader = " "
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.cursorline = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.breakindent = true
vim.opt.wrap = true
vim.opt.linebreak = true

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search higlights" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go half page up" })
vim.keymap.set("n", "n", "nzz", { desc = "Find next" })
vim.keymap.set("n", "N", "Nzz", { desc = "Find prev" })
vim.keymap.set("n", "{", "{zz", { desc = "Go to prev whitespace" })
vim.keymap.set("n", "}", "}zz", { desc = "Go to next whitespace" })

-- tabs 
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab tab" })
