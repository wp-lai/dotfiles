lua << EOF
  -- Get imports ordered on save

  function goimports(timeout_ms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
  end
EOF

" autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
" nnoremap <leader>r :!go run %<cr>

augroup go
    autocmd!
    " setting in go.vim is setlocal indentkeys+=<:>,0=},0=)
    autocmd FileType go setlocal indentkeys-=0=},0=)
    autocmd BufWritePre *.go lua goimports(1000)
    autocmd FileType go nnoremap <leader>r :!go run %<cr>
augroup end



