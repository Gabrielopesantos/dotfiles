local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
  if packer == nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Language Servers
  use {
    'lspcontainers/lspcontainers.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/lsp_extensions.nvim',
    },
    config = function ()
      require'Gabriel.plugins.lspconfig'.init()
    end
  }
  use 'hashivim/vim-terraform'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate',
    config = function ()
      require'Gabriel.plugins.treesitter'.init()
    end,
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'ray-x/cmp-treesitter',
      {
        'tzachar/cmp-tabnine',
        run = "./install.sh",
      },
      'onsails/lspkind-nvim'
    },
    config = function ()
      require'Gabriel.plugins.cmp'.init()
      require'Gabriel.plugins.cmp_tabnine'.init()
      require'Gabriel.plugins.lspkind'.init()
    end
  }

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    -- Not sure if this is needed
    require = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require'Gabriel.plugins.telescope'.init()
    end
  }

  use {
    'base16-project/base16-vim',
    config = function ()
      require'Gabriel.plugins.color_theme'.init()
    end
  }

  -- Git Support
  -- TODO: evaluate how often I am using this (10/19/21)
  use 'rhysd/git-messenger.vim'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require('gitsigns').setup {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }
    end
  }

  -- Utilities
  use 'unblevable/quick-scope' -- promote use of f<key>

use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        show_end_of_line = true,
        -- Not sure?
        show_current_context = true,
        show_current_context_start = true,
    }
      vim.opt.list = true
      vim.opt.listchars:append("eol:↴")
    end
}

  use {
    'hoob3rt/lualine.nvim',
    config = function()
      require'Gabriel.plugins.lualine'.init()
    end
  }

  use 'preservim/nerdcommenter'

  use 'romgrk/nvim-treesitter-context'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function ()
      require'Gabriel.plugins.trouble_config'.init()
    end
  }

  use {
    'folke/lsp-colors.nvim',
    config = function ()
      require("lsp-colors").setup()
    end
  }

  use {
    'voldikss/vim-floaterm',
    config = function ()
      require'Gabriel.plugins.floaterm'.init()
    end
  }

  use {
    'weilbith/nvim-code-action-menu',
    requires = {
      'kosayoda/nvim-lightbulb'
    },
    cmd = 'CodeActionMenu',
    config = function ()
      require'Gabriel.plugins.code_action_menu'.init()
    end
  }

  --use {
    --'kyazdani42/nvim-tree.lua',
    --requires = {
      --'kyazdani42/nvim-web-devicons',
    --},
    --tag = 'nightly', -- optional, updated every week. (see issue #1193)
    --config = function ()
      --require'Gabriel.plugins.tree'.init()
    --end
  --}

  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
    config = function()
      require("neogit").setup{
        integrations = {
          diffview = true
        }
      }
      vim.api.nvim_set_keymap('n', '<leader>ng' , '<CMD>Neogit<CR>', { noremap = true})
    end
  }

end

local function init()
  packer_verify()
  packer_startup()
end

return {
  init = init
}
