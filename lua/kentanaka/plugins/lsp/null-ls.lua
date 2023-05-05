local setup,null_ls = pcall(require,"null_ls")
if not setup then
  return
end
local formatin = null_ls.builtins.formating
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting",{})
null_ls.setup({
  source = {
    formatting.prettier,
    formatting.stylua,
    diagnostics.eslint_d
  },
  on_attach = function(current_client,bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({group = augroup,bugger = bufnr})
      vim.api.nvim_create_autocmd("BufwritePre",{
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
