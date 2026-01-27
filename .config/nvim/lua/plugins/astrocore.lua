-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
      signature_help = true,
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      g = {
        c_syntax_for_h = true,
      },
      opt = { -- vim.opt.<key>
        relativenumber = false,
        number = true,
        spell = false,
        signcolumn = "auto",
        wrap = false,
        expandtab = false,
        tabstop = 4,
        shiftwidth = 4,
        smartcase = true,
        colorcolumn = "80,90",
        wichwrap = vim.opt.whichwrap:append "<,>,[,],h,l",
        termguicolors = true,
        title = false,
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
        ["<C-Left>"] = { ":bprevious<cr>", desc = "Switch to previous buffer" },
        ["<C-Right>"] = { ":bnext<cr>", desc = "Switch to next buffer" },
      },
      v = {
        -- paste without overwriting the clipboard
        ["p"] = { '"_dP', desc = "Paste without yanking replaced text" },
      },
    },
  },
}
