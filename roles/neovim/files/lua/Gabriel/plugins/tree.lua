local function init()
  require("nvim-tree").setup{
    sort_by = "case_sensitive",
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
        },
      },
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  }
end

return {
    init =  init
}
