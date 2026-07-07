---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
      signature_help = true,
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    filetypes = {
      extension = {
        x68 = "m68k",
        asm68k = "m68k",
        inc = "c"
      },
      filename = {
        -- [".foorc"] = "fooscript",
      },
      pattern = {
        -- [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        colorcolumn = "80,90",
        whichwrap = vim.opt.whichwrap:append "<,>,[,],h,l",
        termguicolors = true,
        title = false,
        modeline = true,
      },
      g = { -- vim.g.<key>
        c_syntax_for_h = true,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      i = {
        ["<Up>"] = false,
        ["<Down>"] = false,
      },
      n = {
        ["<Leader>b"] = { desc = "Buffers" },
        ["<C-Up>"] = { "5k", desc = "Move cursor up 5x" },
        ["<C-Down>"] = { "5j", desc = "Move cursor down 5x" },

        -- todos-comments.nvim
        ["<Leader>ft"] = { "<cmd>TodoTelescope<cr>", desc = "Search TODOs" },

        -- Switch buffers
        ["<C-Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<C-Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
      },
      v = {
        -- paste without overwriting the clipboard
        ["p"] = { '"_dP', desc = "Paste without yanking replaced text" },
      },
    },
  },
}
