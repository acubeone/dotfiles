return {
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   opts = {
  --     debug = true,
  --     log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
  --     verbose = true,
  --   },
  -- },

  {
    "saghen/blink.cmp",
    opts = {
      signature = {
        enabled = true,
        trigger = {
          show_on_trigger_character = false,
          show_on_insert = false,
        },
      },
      keymap = {
        preset = "default",

        ["<Up>"] = {},
        ["<Down>"] = {},
      },
    },
  },
  {
    "nvim-highlight-colors",
    opts = {
      render = "virtual",
      virtual_symbol = "",
      virtual_symbol_prefix = " ",
      virtual_symbol_suffix = "",

      ---inline mimics VS Code style
      ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
      ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
      virtual_symbol_position = "eow",

      exclude_filetypes = { "c", "cpp" },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      popup_border_style = "rounded",
      source_selector = {
        sources = {
          { source = "filesystem" },
        },
      },
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            -- vim.cmd("Neotree close")
            require("neo-tree.command").execute { action = "close" }
          end,
        },
      },
      filesystem = {
        window = {
          popup = {
            position = { col = "100%", row = "2" },
            size = function(state)
              local root_name = vim.fn.fnamemodify(state.path, ":~")
              local root_len = string.len(root_name) + 4
              return {
                width = math.max(root_len, 50),
                height = vim.o.lines - 6,
              }
            end,
          },
        },
      },
      window = {
        position = "float",
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "         ▒▒▒        ",
            "     ▒▒▒▒▒▒▒▒▒▒     ",
            " ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ ",
            "░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
            "░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
            "░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒",
            "░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒",
            "░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒",
            "  ░░░░░░░░▒▒▒▒▒▒▒▒  ",
            "     ░░░░░▒▒▒▒▒     ",
            "         ░▒         ",
          }, "\n"),
        },
      },
    },
  },

  { "max397574/better-escape.nvim", enabled = false },

  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })

      require "astronvim.plugins.configs.luasnip"(plugin, opts)
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts)
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            :with_pair(cond.not_after_regex "%%")
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            :with_move(cond.none())
            :with_del(cond.not_after_regex "xx")
            :with_cr(cond.none()),
        },
        Rule("a", "a", "-vim")
      )
    end,
  },

}
