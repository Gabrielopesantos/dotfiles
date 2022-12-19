local function init()
    require('telescope').setup {
        defaults = {
            file_ignore_patterns = {
                "node_modules/.*",
                "secret.d/.*",
                "%.pem",
                ".git/*",
            }
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                --case_mode = "smart_case",
            },
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {},
            }
        }
    }

    local map = vim.api.nvim_set_keymap

    local options = { noremap = true }

    -- Builtin
    map('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>', options)
    map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', options)
    map('n', '<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>', options)
    map('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', options)
    map('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', options)
    map('n', '<leader>fd', '<CMD>lua require("telescope.builtin").diagnostics()<CR>', options)
    map('n', '<leader>fr', '<CMD>lua require("telescope.builtin").registers()<CR>', options)
    map('n', '<leader>fw', '<CMD>lua require("telescope.builtin").grep_string()<CR>', options)
    map('n', '<leader>gst', '<CMD>lua require("telescope.builtin").git_status()<CR>', options)
    vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
        })
    end, { desc = '[/] Fuzzily search in current buffer]' })

    -- Language Servers
    map('n', '<leader>lsd', '<CMD>lua require("telescope.builtin").lsp_definitions{}<CR>', options)
    map('n', '<leader>lsi', '<CMD>lua require("telescope.builtin").lsp_implementations{}<CR>', options)
    map('n', '<leader>lsl', '<CMD>lua require("telescope.builtin").lsp_code_actions{}<CR>', options)
    map('n', '<leader>lst', '<CMD>lua require("telescope.builtin").lsp_type_definitions{}<CR>', options)

    -- Symbols
    map('n', '<leader>ds', '<CMD>lua require("telescope.builtin").lsp_document_symbols{}<CR>', options)
    map('n', '<leader>ws', '<CMD>lua require("telescope.builtin").lsp_dynamic_workspace_symbols{}<CR>', options)

    -- Git
    map('n', '<leader>gcb', '<CMD>lua require("telescope.builtin").git_branches{theme=get_dropdown, previewer=false}<CR>'
        , options)
    map('n', '<leader>gcc', '<CMD>lua require("telescope.builtin").git_commits{}<CR>', options)

    -- Others
    map('n', '<leader>ch', '<CMD>lua require("telescope.builtin").command_history{}<CR>', options)
    map('n', '<leader>sm', '<CMD>lua require("telescope.builtin").marks{}<CR>', options)

end

return {
    init = init,
}
