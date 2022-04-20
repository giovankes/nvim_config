local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  --snippets
   b.completion.luasnip,

   b.formatting.prettierd.with { filetypes = { "html", "css"} },
   b.formatting.deno_fmt,

   -- Lua
   b.formatting.stylua.with({filetypes={"lua"}}),
   b.diagnostics.luacheck,

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   --javascript 
   b.formatting.prettier.with({filetypes= {"javascript", "javascriptreact", "json", "yaml"}}),
   b.diagnostics.eslint.with({filetypes={"javascript","javascriptreact", "json", "yaml"}}),

   --php 
   b.formatting.phpcbf,
   b.diagnostics.php,

   --rust
   b.formatting.rustfmt.with({filetypes={"rust"}}),

   --python
   b.formatting.black.with({filetypes={"python"}}),
   b.diagnostics.pylint.with({filetypes={"python"}}),

   --markdown and text 
   b.formatting.markdownlint.with({filetypes={"markdown"}}),
   b.diagnostics.alex.with({filetypes={"markdown"}}),
   
   -- C++
   b.formatting.clang_format.with({filetypes={"cpp", "cs"}}),
   b.diagnostics.cppcheck.with({filetypes={"cpp", "c"}})
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      -- format on save
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
         end
      end,
   }
end

return M
