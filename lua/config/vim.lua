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

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search higlights" })

-- tabs 
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab tab" })
