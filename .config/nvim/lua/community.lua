---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Langs
  -- { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.godot" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.basedpyright" },
  { import = "astrocommunity.pack.python.ruff" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },

  -- LSP
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  -- { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.nvim-lint" },
  { import = "astrocommunity.lsp.nvim-lsp-endhints" },

  -- Debugging
  { import = "astrocommunity.debugging.nvim-dap-view" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },

  -- UI
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.indent.indent-rainbowline" },
  { import = "astrocommunity.indent.snacks-indent-hlchunk" },
  { import = "astrocommunity.scrolling.nvim-scrollbar" },
  { import = "astrocommunity.scrolling.cinnamon-nvim" },

  -- Settings
  {
    "olimorris/onedarkpro.nvim",
    opts = {
      options = {
        transparency = true,
        highlight_inactive_windows = true,
      },
    },
  },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "90",
      disabled_filetypes = { "help" },
    },
  },
}
