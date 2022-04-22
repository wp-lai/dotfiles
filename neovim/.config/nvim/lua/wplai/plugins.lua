-- {{autoinstall packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end
-- }}

return require("packer").startup({
	function(use)
		use({
			"wbthomason/packer.nvim",
			config = function()
				vim.api.nvim_exec(
					[[
          augroup packer_user_config
            autocmd!
            autocmd BufWritePost plugins.lua source <afile> | PackerCompile
            autocmd User PackerCompileDone echom 'PackerCompile done'
          augroup end
          ]],
					false
				)
			end,
		})

		-- aesthetics
		use({
			"sainnhe/gruvbox-material",
      disable=true,
			setup = function()
				vim.o.termguicolors = true
				vim.g.gruvbox_material_better_performance = 1
			end,
			config = function()
				-- vim.cmd([[colorscheme gruvbox-material]])
			end,
		})
		use({
			"rebelot/kanagawa.nvim",
      disable=true,
			config = function()
				-- vim.cmd("colorscheme kanagawa")
			end,
		})
		use({
			"rmehri01/onenord.nvim",
			config = function()
				vim.cmd("colorscheme onenord")
				vim.cmd([[highlight Normal guibg=none]])
				vim.cmd([[highlight NoneText guibg=none]])
			end,
		})

		use({ "mhinz/vim-startify" })

		use({
			"glepnir/galaxyline.nvim",
			branch = "main",
			config = function()
				require("wplai.statusline")
			end,
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			setup = function()
				vim.g.indent_blankline_filetype_exclude = {
					"help",
					"packer",
					"TelescopePrompt",
				}
				vim.g.indent_blankline_buftype_exclude = { "terminal" }
				vim.g.indent_blankline_char = "|"
				vim.g.indent_blankline_space_char = " "
				vim.g.indent_blankline_show_trailing_blankline_indent = false
				vim.g.indent_blankline_show_first_indent_level = false
				vim.g.indent_blankline_use_treesitter = true
				vim.g.indent_blankline_show_current_context = true
				vim.g.indent_blankline_context_patterns = {
					"class",
					"return",
					"function",
					"method",
					"^if",
					"^for",
					"^while",
					"block",
					"arguments",
					"if_statement",
					"else_clause",
					"try_statement",
					"catch_clause",
					"import_statement",
					"operation_type",
				}
			end,
		})

		use("ntpeters/vim-better-whitespace")

		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({
					override = {
						css = { icon = "", color = "#61afef", name = "css" },
						html = { icon = "", color = "#DE8C92", name = "html" },
						jpeg = { icon = " ", color = "#BD77DC", name = "jpeg" },
						jpg = { icon = " ", color = "#BD77DC", name = "jpg" },
						js = { icon = "", color = "#EBCB8B", name = "js" },
						mp3 = { icon = "", color = "#C8CCD4", name = "mp3" },
						mp4 = { icon = "", color = "#C8CCD4", name = "mp4" },
						out = { icon = "", color = "#C8CCD4", name = "out" },
						png = { icon = " ", color = "#BD77DC", name = "png" },
						toml = { icon = "", color = "#61afef", name = "toml" },
						ts = { icon = "ﯤ", color = "#519ABA", name = "ts" },
						xz = { icon = "", color = "#EBCB8B", name = "xz" },
						zip = { icon = "", color = "#EBCB8B", name = "zip" },
						zsh = { icon = "", color = "#428850", name = "Zsh" },
					},
				})
			end,
		})

		use({
			"google/vim-searchindex",
			keys = "/",
		})

		-- optimization
		use({ "nathom/filetype.nvim" })

		-- utilities
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			keys = "<C-p>",
			setup = function()
				vim.g.nvim_tree_icons = {
					default = " ",
					symlink = " ",
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
					},
					folder = { default = "", open = "" },
				}
			end,
			config = function()
				require("nvim-tree").setup({
					update_cwd = true,
				})
				vim.api.nvim_set_keymap("n", "<C-p>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
			end,
		})

		-- Session management
		use({
			"folke/persistence.nvim",
			disable = true,
			event = "BufReadPre", -- this will only start session saving when an actual file was opened
			module = "persistence",
			config = function()
				require("persistence").setup()

				-- restore the session for the current directory
				vim.api.nvim_set_keymap(
					"n",
					"<leader>qs",
					[[<cmd>lua require("persistence").load()<cr>]],
					{ noremap = true, silent = true }
				)

				-- restore the last session
				vim.api.nvim_set_keymap(
					"n",
					"<leader>ql",
					[[<cmd>lua require("persistence").load({ last = true })<cr>]],
					{ noremap = true, silent = true }
				)

				-- stop Persistence => session won't be saved on exit
				vim.api.nvim_set_keymap(
					"n",
					"<leader>qd",
					[[<cmd>lua require("persistence").stop()<cr>]],
					{ noremap = true, silent = true }
				)
			end,
		})

		use({
			"szw/vim-maximizer",
			keys = "<F3>",
		})

		use("tpope/vim-surround")

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup({})
				local comment_ft = require("Comment.ft")
				comment_ft.solidity = { "// %s", "/*%s*/" }
			end,
		})

		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({})
			end,
		})

		use({
			"mhartington/formatter.nvim",
			ft = { "go", "lua", "rust", "javascript", "typescript", "json", "solidity" },
			config = function()
				local prettier = function()
					return {
						exe = "prettier",
						args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
						stdin = true,
					}
				end
				require("formatter").setup({
					logging = false,
					filetype = {
						javascript = { prettier },
						typescript = { prettier },
						json = { prettier },
						-- npm install -g prettier-plugin-solidity
						solidity = { prettier },
						rust = {
							-- Rustfmt
							function()
								return {
									exe = "rustfmt",
									args = { "--emit=stdout" },
									stdin = true,
								}
							end,
						},
						lua = {
							-- stylua
							function()
								return {
									exe = "stylua",
									args = { "-" },
									stdin = true,
								}
							end,
						},
						go = {
							-- gofmt
							function()
								return {
									exe = "gofmt",
									stdin = true,
								}
							end,
						},
					},
				})
				vim.api.nvim_set_keymap("n", "<leader>=", "<cmd>Format<CR>", { noremap = true })
			end,
		})

		use({
			"voldikss/vim-floaterm",
			keys = "<M-d>",
			config = function()
				vim.api.nvim_set_keymap("n", "<M-d>", ":FloatermToggle<CR>", { noremap = true, silent = true })
				vim.api.nvim_set_keymap(
					"t",
					"<M-d>",
					"<C-\\><C-n>:FloatermToggle<CR>",
					{ noremap = true, silent = true }
				)
			end,
		})

		use({
			"tweekmonster/startuptime.vim",
			opt = true,
		})

		-- telescope
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
			config = [[ require("wplai.telescope") ]],
		})
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		})
		use({
			"jvgrootveld/telescope-zoxide",
			config = function()
				require("telescope").load_extension("zoxide")

				vim.api.nvim_set_keymap(
					"n",
					"<leader>fz",
					":lua require'telescope'.extensions.zoxide.list{}<CR>",
					{ noremap = true, silent = true }
				)
			end,
		})

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = [[ require('wplai.treesitter') ]],
			requires = {
				{
					"nvim-treesitter/nvim-treesitter-refactor",
				},
				{
					"nvim-treesitter/nvim-treesitter-textobjects",
				},
				{
					"p00f/nvim-ts-rainbow",
				},
				{
					"windwp/nvim-ts-autotag",
					ft = { "html", "xml" },
				},
				{
					"JoosepAlviste/nvim-ts-context-commentstring",
				},
			},
		})

		-- completion
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-nvim-lsp-document-symbol",
				"lukas-reineke/cmp-rg",
				"onsails/lspkind-nvim",
				"saadparwaiz1/cmp_luasnip",
				"ray-x/cmp-treesitter",
			},
			config = [[ require("wplai.nvim-cmp") ]],
		})

		-- language server
		use({
			"neovim/nvim-lspconfig",
			ft = { "go", "rust", "lua", "javascript", "html", "css", "json", "typescript", "solidity" },
			config = [[ require"wplai.lsp" ]],
		})

		use({
			"simrat39/symbols-outline.nvim",
			ft = { "go", "lua", "javascript" },
			setup = function()
				vim.g.symbols_outline = { keymaps = { close = "q" } }
			end,
			config = function()
				vim.api.nvim_set_keymap("n", "gO", ":SymbolsOutline<CR>", { noremap = true, silent = true })
			end,
		})

		-- snippets
		use({
			"L3MON4D3/LuaSnip",
			config = [[ require("wplai.snippet") ]],
		})

		-- linter
		use({
			"mfussenegger/nvim-lint",
			ft = { "go", "rust" },
			disable = true,
			config = function()
				require("lint").linters_by_ft = {
					go = { "golangcilint" },
				}
				vim.cmd([[
        augroup nvim-lint
          autocmd!
          autocmd BufWritePost *.go lua require('lint').try_lint()
        augroup END
        ]])
			end,
		})

		use({
			"dense-analysis/ale",
			disable = true,
			ft = "solidity",
			setup = function()
				vim.g.ale_solidity_solc_options = "--base-path . --include-path node_modules/"
				-- vim.g.ale_solidity_solc_executable = '/Users/wplai/Library/Caches/hardhat-nodejs/compilers/macosx-amd64/solc-macosx-amd64-v0.8.9+commit.e5eed63a'
			end,
		})

		use({
			"folke/trouble.nvim",
			config = function()
				require("trouble").setup({
					fold_open = "▾",
					fold_closed = "▸",
					indent_lines = false,
					signs = {
						error = "",
						warning = "",
						hint = "",
						information = "",
						other = "",
					},
					action_keys = { jump = { "<cr>" }, toggle_fold = { "<tab>" } },
				})
				vim.api.nvim_set_keymap("n", "<space>xx", "<cmd>TroubleToggle<CR>", { silent = true, noremap = true })
				vim.api.nvim_set_keymap(
					"n",
					"<space>xw",
					"<cmd>TroubleToggle lsp_workspace_diagnostics<CR>",
					{ silent = true, noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<space>xb",
					"<cmd>TroubleToggle lsp_document_diagnostics<CR>",
					{ silent = true, noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<space>xq",
					"<cmd>TroubleToggle quickfix<CR>",
					{ silent = true, noremap = true }
				)
			end,
		})

		-- json
		use({
			"gennaro-tedesco/nvim-jqx",
			ft = "json",
		})

		-- http client
		use({
			"NTBBloodbath/rest.nvim",
			disable = true,
			ft = "http",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("rest-nvim").setup()
			end,
		})

		-- for package.json
		use({
			"vuki656/package-info.nvim",
			requires = "MunifTanjim/nui.nvim",
			disable = true,
			config = function()
				require("package-info").setup({
					package_manager = "npm",
				})
				-- Show package versions
				vim.api.nvim_set_keymap(
					"n",
					"<leader>ns",
					":lua require('package-info').show()<CR>",
					{ silent = true, noremap = true }
				)
				-- Hide package versions
				vim.api.nvim_set_keymap(
					"n",
					"<leader>nc",
					":lua require('package-info').hide()<CR>",
					{ silent = true, noremap = true }
				)
				-- Update package on line
				vim.api.nvim_set_keymap(
					"n",
					"<leader>nu",
					":lua require('package-info').update()<CR>",
					{ silent = true, noremap = true }
				)
				-- Delete package on line
				vim.api.nvim_set_keymap(
					"n",
					"<leader>nd",
					":lua require('package-info').delete()<CR>",
					{ silent = true, noremap = true }
				)
				-- Install a new package
				vim.api.nvim_set_keymap(
					"n",
					"<leader>ni",
					":lua require('package-info').install()<CR>",
					{ silent = true, noremap = true }
				)
				-- Reinstall dependencies
				vim.api.nvim_set_keymap(
					"n",
					"<leader>nr",
					":lua require('package-info').reinstall()<CR>",
					{ silent = true, noremap = true }
				)
				-- Install a different package version
				vim.api.nvim_set_keymap(
					"n",
					"<leader>np",
					":lua require('package-info').change_version()<CR>",
					{ silent = true, noremap = true }
				)
			end,
		})

		-- solidity
		use({
			"tomlion/vim-solidity",
			ft = "solidity",
		})

		-- git
		use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
		use({ "tpope/vim-fugitive" })
		use({
			"lewis6991/gitsigns.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("gitsigns").setup()
			end,
		})
	end,
})
