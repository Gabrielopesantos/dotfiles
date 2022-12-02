local function on_attach(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Mappings
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', '<cmd>lua vim.lsp.buf.definition{ reuse_win = true }<CR>', '[G]oto [D]efinition')
  nmap('gD', '<cmd>lua vim.lsp.buf.declaration{ reuse_win = true }<CR>', '[G]oto [D]eclaration')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references, 'G[o]to [R]eferences')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Doesn't need to be here
  nmap('[d', vim.diagnostic.goto_prev)
  nmap(']d', vim.diagnostic.goto_next)
  nmap('<leader>e', vim.diagnostic.open_float)
  nmap('<leader>q', vim.diagnostic.setloclist)

  nmap('<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', 'Format')

  end

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.snippetSupport = true
  capabilities.textDocument.completion.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }

  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach
  }
end

local function init()
  local servers = { 'clangd', 'rust_analyzer', 'pylsp', 'gopls', 'sumneko_lua', 'yamlls', 'jsonls', "dockerls", "terraformls", "bashls" }

  require('mason-lspconfig').setup {
    ensure_installed = servers,
    automatic_installation = true,
  }

  for _, lsp in ipairs(servers) do
    local config = make_config()
    require('lspconfig')[lsp].setup(config)
    if (lsp == "rust_analyzer") then
      require('rust-tools').setup({ server = config })
    end
  end
end

return {
  init = init
}
