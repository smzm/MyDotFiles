-- ======== Typescript and Javascript 
-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup{
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}


-- ======== Vim 
-- npm install -g vim-language-server
require'lspconfig'.vimls.setup {}

-- ======== Python
-- npm i -g pyright
require'lspconfig'.pyright.setup{
  
-- ======== json
-- npm install -g vscode-json-languageserver
require'lspconfig'.jsonls.setup {}
  
-- ======== HTML
-- npm install -g vscode-html-languageserver-bin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {}
  
-- ======== CSS
-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup{}
