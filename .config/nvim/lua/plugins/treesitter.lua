---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true, -- enable/disable treesitter based highlighting
      indent = true, -- enable/disable treesitter based indentation
      auto_install = false, -- enable/disable automatic installation of detected languages
      ensure_installed = {
        "lua",
        "vim",
        "c",
        "cpp",
      },
    },
  },
}
