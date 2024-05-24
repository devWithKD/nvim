require("mason").setup()

local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd", "cssls", "cssmodules_ls", 
  "dockerls", "docker_compose_language_service","eslint", "graphql", "html", 
  "htmx", "jsonls", "jdtls", "tsserver", "quick_lint_js",
  -- "pyre",
  "sqlls", "tailwindcss" }
})

require("lspconfig").lua_ls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").cssls.setup {}
require("lspconfig").cssmodules_ls.setup {}
require("lspconfig").dockerls.setup {}
require("lspconfig").docker_compose_language_service.setup {}
require("lspconfig").graphql.setup {}
require("lspconfig").eslint.setup {}
require("lspconfig").html.setup {}
require("lspconfig").htmx.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").jdtls.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").quick_lint_js.setup {}
-- require("lspconfig").pyre.setup {}
require("lspconfig").sqlls.setup {}
require("lspconfig").tailwindcss.setup {}



lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
