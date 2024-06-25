return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },{
    "nvim-neorg/neorg",
    lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
    -- tag = "*",
    dependencies = { 
      "luarocks.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter"
      },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
        },
      }
    end,
    }
}
