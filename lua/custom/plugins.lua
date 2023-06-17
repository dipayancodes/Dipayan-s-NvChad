local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- Tabnine
  {
    'tzachar/compe-tabnine',
    run = './install.sh',
    requires = 'hrsh7th/nvim-compe',
    config = function()
      require('compe').setup {
        source = {
          path = true,
          buffer = true,
          calc = true,
          nvim_lsp = true,
          nvim_lua = true,
          vsnip = true,
          tabnine = true,
        },
      }
    end,
  },


   {
  "norcalli/snippets.nvim",
  config = function()
    require("snippets").use_suggested_mappings()
  end,
  requires = {
    "nvim-lua/plenary.nvim"
  }
},





{
	"lukas-reineke/indent-blankline.nvim",
	opts = function(_, opts)
		return require("indent-rainbowline").make_opts(opts)
	end,
	dependencies = {
		"TheGLander/indent-rainbowline.nvim",
	},
},



 -- auto renaming tag in html and other files 
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require'nvim-treesitter.configs'.setup {
        autotag = {
          enable = true,
        }
      } 
    end
  },













  



  

  -- CHAT GPT.NVIM
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = [=[os.execute('setx OPENAI_API_KEY "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"')]=]
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
}

return plugins
