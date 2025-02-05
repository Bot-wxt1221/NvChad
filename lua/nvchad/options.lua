local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH
require("nvchad.configs.dap.init").setup()
require('competitest').setup{
 template_file ="/home/wxt/Working/OI/Temp.cpp",
 compile_command ={
    cpp={exec="g++",args={"$(FNAME)","-Wall","-std=c++14","-DONLINE_JUDGE","-fsanitize=undefined,address","-o",".cph/$(FNOEXT).cphbin"}}
  },
  run_command={
    cpp={exec="./.cph/$(FNOEXT).cphbin"}
  },
  testcases_directory="./.cph",
  evaluate_template_modifiers=true,
  multiple_testing=2,
  maximum_time=20000,
  view_output_diff=true,
  popup_ui={layout = {
  { 1, {
       { 1, "so" },
       { 1, {
            { 1, "tc" },
            { 1, "se" },
          } },
     } },
  { 1, {
       { 1, "eo" },
       { 1, "si" },
     } },
  }
  },
} -- to use default configuration
require("nvchad.configs.cph").setup()

local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = { "markdown", "markdown_inline", "lua", "typescript", "html" ,'c','cpp'},
  sync_install = true,
 highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
})


-- if you just want default config for the servers then put them in a table
local rainbow_delimiters = require 'rainbow-delimiters'
-- This module contains a number of default definitions
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}
