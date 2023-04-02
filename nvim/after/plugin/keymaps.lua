local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

-- Folding keymaps
-- (FYI: zM = Close All Folds, zR = Open All Folds)
nmap('<leader>f', 'zc', '[F]old')
nmap('<leader>of', 'zo', '[O]pen [F]old')

-- Move line up or down
nmap('<leader>j', 'ddp', 'Move line down')
nmap('<leader>k', 'ddkP', 'Move line up')
