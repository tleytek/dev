-- Manual Harpoon v2 installation since vim.pack.add doesn't support the harpoon2 branch
local data_path = vim.fn.stdpath("data")
local harpoon2_path = data_path .. "/site/pack/core/opt/harpoon-v2"

-- Check if we need to clone Harpoon v2
if vim.fn.isdirectory(harpoon2_path) == 0 then
	vim.fn.system(
		string.format("git clone -b harpoon2 --depth 1 https://github.com/ThePrimeagen/harpoon.git %s", harpoon2_path)
	)
end

-- Add harpoon2 to runtime path
vim.opt.rtp:prepend(harpoon2_path)

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
})

local harpoon = require("harpoon")
harpoon:setup({
	settings = {
		save_on_toggle = true,
	},
})

-- Telescope extension
require("telescope").load_extension("harpoon")

-- Extensions
local harpoon_extensions = require("harpoon.extensions")
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

-- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end

-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })

vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)

for i = 1, 4 do
	vim.keymap.set("n", ("<C-%s>"):format(("htsn"):sub(i, i)), function()
		harpoon:list():select(i)
	end)
end
