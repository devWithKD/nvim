local trouble = require("trouble")

trouble.setup({
	opts = {},
})

vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end)

vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end)
