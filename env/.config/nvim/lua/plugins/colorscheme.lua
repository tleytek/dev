vim.pack.add({
  {
    src = "https://github.com/rose-pine/neovim"
  }
})
require("rose-pine").setup({
  disable_background = true,
})

vim.cmd[[colorscheme rose-pine]]
