require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"javascript",
		"typescript",
		"json",
		"rust",
		"solidity",
		"graphql",
		"toml",
		"go",
		"html",
	},
	highlight = { enable = true },
	indent = { enable = true },
	-- nvim-treesitter-refactor
	refactor = {
		highlight_definitions = { enable = true, clear_on_cursor_move = true },
		highlight_current_scope = { enable = false },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "<leader>gr", -- mapping to rename reference under cursor
			},
		},
	},
	-- nvim-treesitter-textobjects
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		-- nvim-ts-rainbow
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = 1000,
		},
		-- nvim-ts-autotag
		autotag = {
			enable = true,
		},
		-- nvim-ts-context-commentstring
		context_commentstring = {
			enable = true,
		},
	},
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
