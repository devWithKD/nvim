local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    javascript = {  "prettier"  },
    javascriptreact = {  "prettier"  },
    typescript = { "prettier" },
    typescriptreact = {  "prettier"  },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
    async = false,
  },
})

vim.keymap.set({"n","v"}, "<leader>mp", function ()
  conform.format({
    timeout_ms = 500,
    lsp_fallback = true,
    async = false,
  })
end)
