---@type LazySpec
return {
  -- Actions
  { "nvim-mini/mini.comment" },
  {
    "nvim-mini/mini.move",
    keys = function(_, keys)
      local plugin = require("lazy.core.config").spec.plugins["mini.move"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false) -- resolve mini.clue options
      -- Populate the keys based on the user's options
      local mappings = {
        { opts.mappings.line_left, desc = "Move line left" },
        { opts.mappings.line_right, desc = "Move line right" },
        { opts.mappings.line_down, desc = "Move line down" },
        { opts.mappings.line_up, desc = "Move line up" },
        { opts.mappings.left, desc = "Move selection left", mode = "v" },
        { opts.mappings.right, desc = "Move selection right", mode = "v" },
        { opts.mappings.down, desc = "Move selection down", mode = "v" },
        { opts.mappings.up, desc = "Move selection up", mode = "v" },
      }
      mappings = vim.tbl_filter(function(m) return m[1] and #m[1] > 0 end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        left = "<A-Left>",
        right = "<A-Right>",
        down = "<A-Down>",
        up = "<A-Up>",
        line_left = "<A-Left>",
        line_right = "<A-Right>",
        line_down = "<A-Down>",
        line_up = "<A-Up>",
      },
    },
  },

  -- Misc
  { "jannis-baum/vivify.vim" }, 
  {
    "cappyzawa/trim.nvim",
    lazy = false,
    event = "BufWritePre",
    opts = {},
  },
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {},
  },

  -- Override
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
