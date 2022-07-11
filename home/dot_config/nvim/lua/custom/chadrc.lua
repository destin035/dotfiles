local M = {}

local override = require "custom.override"

M.plugins = {
   override = {
     ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
   }
}

M.ui = {
   theme = "gruvchad",
}

return M
