local ls = require "luasnip"
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local root_dir = vim.fn.getcwd()
local workspace_name = vim.fn.fnamemodify(root_dir, ":t")

ls.add_snippets("all", {
  ls.snippet("lgpl", {
    t "// ",
    f(function() return workspace_name end),
    t " - ",
    i(1, "Brief description."),
    t { "", "// Copyright (C) " .. os.date "%Y" .. "  " },
    i(2, "aCube"),
    t {
      "",
      "//",
      "// This library is free software; you can redistribute it and/or",
      "// modify it under the terms of the GNU Lesser General Public",
      "// License as published by the Free Software Foundation; either",
      "// version 2.1 of the License, or (at your option) any later version.",
      "//",
      "// This library is distributed in the hope that it will be useful,",
      "// but WITHOUT ANY WARRANTY; without even the implied warranty of",
      "// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU",
      "// Lesser General Public License for more details.",
      "//",
      "// You should have received a copy of the GNU Lesser General Public",
      "// License along with this library; if not, see",
      "// <https://www.gnu.org/licenses/>.",
    },
    i(0),
  }),
})
