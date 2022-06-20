local function init()
  require('lualine').setup {
    options = {
      extensions = { 'fzf', 'quickfix' },
      theme = 'auto',
    }
  }
end

return {
  init = init
}
