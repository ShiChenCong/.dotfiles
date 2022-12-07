require 'nvim-treesitter.configs'.setup {}

local ft_to_parser = require "nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.less = "scss" -- the someft filetype will use the python parser and queries.
