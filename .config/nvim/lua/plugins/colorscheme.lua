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
}
