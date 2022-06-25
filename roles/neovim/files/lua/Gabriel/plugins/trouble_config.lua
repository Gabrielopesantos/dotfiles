local function init()
  require('trouble').setup()

  local map = vim.api.nvim_set_keymap
  local options = { noremap = true }

  map('n', '<leader>hh', '<CMD>Trouble<CR>', options)

end

return {
  init = init
}
