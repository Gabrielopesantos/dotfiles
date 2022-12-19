local function init()
    require('lualine').setup {
        options = {
            theme = 'auto',
        },
        extensions = { 'fzf', 'quickfix' },
    }
end

return {
    init = init
}
