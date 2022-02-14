local function init()
  require('lualine').setup {
    options = {
      extensions = { 'fzf', 'quickfix' },
      theme = 'onedark'
    }
  }
end

return {
  init = init
}
