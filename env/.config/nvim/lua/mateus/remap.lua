vim.g.mapleader = " "

-- Using oil now instead of netrw
-- vim.keymap.set("n", "<leader>pe", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- visual selection paste without clearing out the current yank
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], {
	desc = "Yank to system clipboard",
})
vim.keymap.set("n", "<leader>Y", [["+Y]], {
	desc = "Yank line (to end) to system clipboard",
})

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Error navigation stuff?
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- haha go nil
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<Up>", "", { noremap = true })
vim.keymap.set("n", "<Down>", "", { noremap = true })
vim.keymap.set("n", "<Left>", "", { noremap = true })
vim.keymap.set("n", "<Right>", "", { noremap = true })

vim.keymap.set("i", "<Up>", "", { noremap = true })
vim.keymap.set("i", "<Down>", "", { noremap = true })
vim.keymap.set("i", "<Left>", "", { noremap = true })
vim.keymap.set("i", "<Right>", "", { noremap = true })

vim.keymap.set("n", "<Home>", "", { noremap = true })
vim.keymap.set("n", "<End>", "", { noremap = true })
vim.keymap.set("n", "<PageUp>", "", { noremap = true })
vim.keymap.set("n", "<PageDown>", "", { noremap = true })

vim.keymap.set("i", "<Home>", "", { noremap = true })
vim.keymap.set("i", "<End>", "", { noremap = true })
vim.keymap.set("i", "<PageUp>", "", { noremap = true })
vim.keymap.set("i", "<PageDown>", "", { noremap = true })
