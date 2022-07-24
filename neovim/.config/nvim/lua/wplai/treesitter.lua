require("nvim-treesitter.configs").setup({
	-- ensure_installed = { "go", "lua", "python", "c", "html", "javascript", "json", "toml", "solidity" },
	ensure_installed = { "lua", "javascript", "typescript", "json", "rust", "solidity", "graphql" },
	ignore_install = {},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	-- nvim-treesitter-refactor
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = false },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "<leader>gr", -- mapping to rename reference under cursor
			},
		},
		navigation = {
			enable = false,
			keymaps = {
				goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
				list_definitions = "gnD", -- mapping to list all definitions in current file
				list_definitions_toc = nil,
				goto_next_usage = "<leader>n",
				goto_previous_usage = "<leader>N",
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
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["aC"] = "@class.outer",
				["iC"] = "@class.inner",
				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",
				["aB"] = "@block.outer",
				["iB"] = "@block.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["is"] = "@statement.inner",
				["as"] = "@statement.outer",
				["am"] = "@call.outer",
				["im"] = "@call.inner",
				["ad"] = "@comment.outer",
				["id"] = "@comment.inner",

				-- Or you can define your own textobjects like this
				-- ["iF"] = {
				--   python = "(function_definition) @function",
				--   cpp = "(function_definition) @function",
				--   c = "(function_definition) @function",
				--   java = "(method_declaration) @function",
				-- },
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@function.outer",
				-- ["]]"] = "@class.outer"
				-- ["]a"] = "@parameter.inner",
			},
			-- goto_next_end = {
			-- 	["]["] = "@function.outer",
			-- 	-- ["]["] = "@class.outer"
			-- },
			goto_previous_start = {
				["[f"] = "@function.outer",
				-- ["[["] = "@class.outer"
				-- ["[a"] = "@parameter.inner",
			},
			-- goto_previous_end = {
			-- 	["[]"] = "@function.outer",
			-- 	-- ["[]"] = "@class.outer"
			-- },
		},
		-- lsp_interop = {
		-- 	enable = true,
		-- 	peek_definition_code = {
		-- 		["df"] = "@function.outer",
		-- 		["dF"] = "@class.outer",
		-- 	},
		-- },
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
		filetype = { "html", "xml" },
	},
	-- nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
	},
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
