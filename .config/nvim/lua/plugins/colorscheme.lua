return {
	{
		"uhs-robert/oasis.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			style = "night",
			transparent = true,
			contrast = {
				min_ratio = 7.0,
				force_aaa = true,
			},
			highlight_overrides = function(c)
				return {
					Normal = { fg = "#FFFFFF", bg = "NONE" },
					NormalNC = { fg = "#FFFFFF", bg = "NONE" },
					NormalFloat = { fg = "#FFFFFF", bg = "NONE" },
					FloatBorder = { bg = "NONE" },
					SignColumn = { bg = "NONE" },
					StatusLine = { bg = "NONE" },
					TabLine = { bg = "NONE" },
					TabLineFill = { bg = "NONE" },
					WinBar = { bg = "NONE" },
				}
			end,
		},
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				on_highlights = function(hl, c)
					hl.Normal = { fg = c.fg_dark, bg = "NONE" }
					hl.NormalNC = { fg = c.fg_dark, bg = "NONE" }
					hl.Comment = { fg = c.comment, italic = true }
					hl.GitSignsAdd = { fg = c.green }
					hl.GitSignsChange = { fg = c.yellow }
					hl.GitSignsDelete = { fg = c.red }
				end,
			}
		end,
	},
	{
		"navarasu/onedark.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			style = "darker",
			transparent = true,
			term_colors = true,
			highlights = {
				EndOfBuffer = { fg = "#535965" },
			},
		},
		config = function(_, opts)
			require("onedark").setup(opts)
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		priority = 1000,
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
				},
			})
		end,
	},
	{
		"deparr/tairiki.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("tairiki").setup({
				palette = "dark",
				transparent = true,
				terminal = true,
			})
		end,
	},
}
