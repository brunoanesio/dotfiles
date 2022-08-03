require("nvim-surround").setup({
	keymaps = {
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "ys",
		normal_cur = "yss",
		normal_line = "yS",
		normal_cur_line = "ySS",
		visual = "S",
		visual_line = "gS",
		delete = "ds",
		change = "cs",
	},
	delimiters = {
		pairs = {
			["("] = { "( ", " )" },
			[")"] = { "(", ")" },
			["{"] = { "{ ", " }" },
			["}"] = { "{", "}" },
			["<"] = { "< ", " >" },
			[">"] = { "<", ">" },
			["["] = { "[ ", " ]" },
			["]"] = { "[", "]" },
			["i"] = function()
				return {
					require("nvim-surround.utils").get_input("Enter the left delimiter: "),
					require("nvim-surround.utils").get_input("Enter the right delimiter: "),
				}
			end,
			["f"] = function()
				return {
					require("nvim-surround.utils").get_input("Enter the function name: ") .. "(",
					")",
				}
			end,
		},
		separators = {
			["'"] = { "'", "'" },
			['"'] = { '"', '"' },
			["`"] = { "`", "`" },
		},
		HTML = {
			["t"] = "type",
			["T"] = "whole",
		},
		aliases = {
			["a"] = ">",
			["b"] = ")",
			["B"] = "}",
			["r"] = "]",
			["q"] = { '"', "'", "`" },
			["s"] = { ")", "]", "}", ">", "'", '"', "`" },
		},
	},
	highlight_motion = { -- Highlight before inserting/changing surrounds
		duration = 0,
	},
})
