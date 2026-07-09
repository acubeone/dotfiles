local ls = require "luasnip"
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local comment_map = {
  lua = "--",
  c = "//",
  cpp = "//",
  verilog = "//",
  systemverilog = "//",
  python = "#",
  make = "#",
}

local function comment_token()
  local ft = vim.bo.filetype
  return comment_map[ft] or "//"
end
local function current_year() return os.date "%Y" end

local function current_filename() return vim.fn.expand "%:t" end

local function current_workspace()
  local root_dir = vim.fn.getcwd()
  return vim.fn.fnamemodify(root_dir, ":t")
end

local function zlib_header()
  local c = comment_token()
  local fname = current_filename()
  local workspace = current_workspace()

  return sn(nil, {
    t { ("%s %s - %s"):format(c, workspace, fname), c },
    t { "", c .. " Copyright (c) " },
    d(1, function() return sn(nil, { t(current_year()) }) end, {}),
    t " ",
    i(2, "acubeone"),
    t { "", c .. " Email: " },
    i(3, "acube_one@disroot.org"),
    t { "", c .. "" },
    t {
      "",
      c .. " This software is provided 'as-is', without any express or implied",
      c .. " warranty. In no event will the authors be held liable for any damages",
      c .. " arising from the use of this software.",
      c .. "",
      c .. " Permission is granted to anyone to use this software for any purpose,",
      c .. " including commercial applications, and to alter it and redistribute it",
      c .. " freely, subject to the following restrictions:",
      c .. "",
      c .. " 1. The origin of this software must not be misrepresented; you must not",
      c .. "    claim that you wrote the original software. If you use this software",
      c .. "    in a product, an acknowledgment in the product documentation would be",
      c .. "    appreciated but is not required.",
      c .. " 2. Altered source versions must be plainly marked as such, and must not be",
      c .. "    misrepresented as being the original software.",
      c .. " 3. This notice may not be removed or altered from any source",
      c .. "    distribution.",
    },
    t { "", "" },
    i(0),
  })
end

local function lgpl_header()
  local c = comment_token()
  local fname = current_filename()
  local workspace = current_workspace()

  return sn(nil, {
    t { ("%s %s - %s"):format(c, workspace, fname), c },
    t { "", c .. " Copyright (c) " },
    d(1, function() return sn(nil, { t(current_year()) }) end, {}),
    t " ",
    i(2, "acubeone"),
    t { "", c .. " Email: " },
    i(3, "acube_one@disroot.org"),
    t { "", c .. "" },
    t {
      "",
      c .. " This library is free software; you can redistribute it and/or",
      c .. " modify it under the terms of the GNU Lesser General Public",
      c .. " License as published by the Free Software Foundation; either",
      c .. " version 2.1 of the License, or (at your option) any later version.",
      c .. "",
      c .. " This library is distributed in the hope that it will be useful,",
      c .. " but WITHOUT ANY WARRANTY; without even the implied warranty of",
      c .. " MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU",
      c .. " Lesser General Public License for more details.",
      c .. "",
      c .. " You should have received a copy of the GNU Lesser General Public",
      c .. " License along with this library; if not, see",
      c .. " <https://www.gnu.org/licenses/>.",
    },
    t { "", "" },
    i(0),
  })
end

ls.add_snippets("all", {
  ls.snippet("zlib", {
    d(1, zlib_header, {}),
  }),
  ls.snippet("lgpl", {
    d(1, lgpl_header, {}),
  }),
})
