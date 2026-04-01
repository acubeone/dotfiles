-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set formatters
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
    })

    opts.sources = vim.tbl_filter(function(source) return source.name ~= "clang_format" end, opts.sources)

    table.insert(
      opts.sources,
      null_ls.builtins.formatting.clang_format.with {
        extra_args = function(params)
          if params.bufname:match "%.inc$" then return { "--assume-filename=file.c" } end
          return {}
        end,
      }
    )

    return opts
  end,
}
