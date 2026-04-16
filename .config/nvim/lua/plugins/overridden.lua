return {
  {
    "ray-x/lsp_signature.nvim",
    opts = {
      transparency = 50,
      move_signature_window_key = { "<M-Down>", "<M-Up>" },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
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
}
