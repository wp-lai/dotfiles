-- {{autoinstall packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end
-- }}

return require("packer").startup({
	function(use)
		if packer_bootstrap then
			require("packer").sync()
		end

		-- essential
		use({
			"wbthomason/packer.nvim",
			config = function()
				vim.cmd([[
          augroup packer_user_config
            autocmd!
            autocmd BufWritePost plugins.lua source <afile> | PackerCompile
            autocmd User PackerCompileDone echom 'PackerCompile done'
          augroup end
          ]])
			end,
		})
		use("nvim-lua/plenary.nvim")
		use({
			"nvim-tree/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({})
			end,
		})

		-- optimization
		use({ "nathom/filetype.nvim" })
		use({ "lewis6991/impatient.nvim" })

		-- surround
		use("tpope/vim-surround")

		-- pairs
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
				require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
			end,
		})

		-- rm whitespace
		use("ntpeters/vim-better-whitespace")

		-- comment
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup({})
			end,
		})
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({})
			end,
		})

		-- smooth scroll
		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup()
			end,
		})

		-- search
		use({
			"google/vim-searchindex",
			keys = "/",
		})

		-- fuzzy finding - telescope
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("telescope").setup({})

				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
				vim.keymap.set("n", "<leader>wg", builtin.live_grep, {})
				vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
				vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
				vim.keymap.set("n", "<leader>fs", builtin.treesitter, {})
				vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, {})
				vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})

				vim.keymap.set(
					"n",
					"<leader>en",
					"<cmd>lua require('telescope.builtin').find_files{cwd='~/.config/nvim'}<CR>"
				)
			end,
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
				vim.keymap.set("n", "<leader>fz", ":lua require'telescope'.extensions.zoxide.list{}<CR>")
			end,
		})
		use({
			"smartpde/telescope-recent-files",
			config = function()
				require("telescope").load_extension("recent_files")
				vim.keymap.set("n", "<Leader>fr", [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]])
			end,
		})

		-- tab
		use({
			"akinsho/bufferline.nvim",
			tag = "v3.*",
			config = function()
				require("bufferline").setup({
					options = {
						diagnostics = "nvim_lsp",
						disgnostics_update_in_insert = true,
					},
				})
				vim.keymap.set("n", "]b", ":BufferLineCycleNext<CR>")
				vim.keymap.set("n", "[b", ":BufferLineCyclePrev<CR>")
			end,
		})

		-- status line
		use({
			"glepnir/galaxyline.nvim",
			branch = "main",
			config = function()
				require("wplai.statusline")
			end,
		})

		-- aesthetics
		use({
			"catppuccin/nvim",
			as = "catppuccin",
			run = ":CatppuccinCompile",
			config = function()
				require("catppuccin").setup({
					transparent_background = true,
					term_colors = true,
					integrations = {
						cmp = true,
						gitsigns = true,
						telescope = true,
						treesitter = true,
						treesitter_context = true,
						ts_rainbow = true,
						native_lsp = {
							enabled = true,
							virtual_text = {
								errors = { "italic" },
								hints = { "italic" },
								warnings = { "italic" },
								information = { "italic" },
							},
							underlines = {
								errors = { "underline" },
								hints = { "underline" },
								warnings = { "underline" },
								information = { "underline" },
							},
						},
					},
				})
				-- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
				vim.cmd([[colorscheme catppuccin-mocha]])
			end,
		})
		use({
			"hood/popui.nvim",
			config = function()
				vim.ui.select = require("popui.ui-overrider")
				vim.ui.input = require("popui.input-overrider")
			end,
		})

		-- indentation guids
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("indent_blankline").setup({
					show_current_context = true,
					show_current_context_start = true,
				})
			end,
		})

		-- start screen
		use({ "mhinz/vim-startify" })

		-- maximize window
		use({
			"szw/vim-maximizer",
			keys = "<F3>",
		})

		-- folding
		use({
			"kevinhwang91/nvim-ufo",
			requires = "kevinhwang91/promise-async",
			config = function()
				vim.keymap.set("n", "zR", require("ufo").openAllFolds)
				vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
				require("ufo").setup({
					provider_selector = function(_, _, _)
						return { "treesitter", "indent" }
					end,
				})
			end,
		})

		-- marks
		use({
			"chentoast/marks.nvim",
			config = function()
				require("marks").setup()
			end,
		})

		-- formatter
		use({
			"mhartington/formatter.nvim",
			ft = {
				"go",
				"lua",
				"rust",
				"javascript",
				"typescript",
				"json",
				"solidity",
				"javascriptreact",
				"typescriptreact",
				"solidity",
			},
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
						javascriptreact = { prettier },
						typescriptreact = { prettier },
						json = { prettier },
						-- npm install -g prettier-plugin-solidity
						solidity = { prettier },
						rust = {
							-- Rustfmt
							function()
								return {
									exe = "rustfmt",
									args = { "--emit=stdout --edition=2021" },
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
				vim.keymap.set("n", "<leader>=", "<cmd>Format<CR>")
			end,
		})

		-- float terminal
		use({
			"voldikss/vim-floaterm",
			keys = "<M-d>",
			config = function()
				vim.keymap.set("n", "<M-d>", ":FloatermToggle<CR>")
				vim.keymap.set("t", "<M-d>", "<C-\\><C-n>:FloatermToggle<CR>")
			end,
		})

		-- startuptime
		use({
			"tweekmonster/startuptime.vim",
			opt = true,
		})

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
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
				},
				{
					"JoosepAlviste/nvim-ts-context-commentstring",
				},
				{
					"nvim-treesitter/nvim-treesitter-context",
				},
			},
			config = function()
				require("wplai.treesitter")
			end,
		})
		use({
			"JoseConseco/iswap.nvim",
			config = function()
				require("iswap").setup({})
				vim.keymap.set("n", "<leader>sw", ":ISwapWith<CR>")
			end,
		})

		-- completion
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lsp-document-symbol",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"lukas-reineke/cmp-rg",
				"saadparwaiz1/cmp_luasnip",
				"ray-x/cmp-treesitter",
			},
			config = function()
				require("wplai.nvim-cmp")
			end,
		})

		-- copilot
		use({
			"zbirenbaum/copilot.lua",
			event = "VimEnter",
			config = function()
				vim.schedule(function()
					require("copilot").setup()
				end)
			end,
		})
		use({
			"zbirenbaum/copilot-cmp",
			after = { "copilot.lua" },
			config = function()
				require("copilot_cmp").setup()
			end,
		})

		-- snippets
		use({
			"L3MON4D3/LuaSnip",
			tag = "v1.*",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load({
					paths = { "$HOME/.config/nvim/snippets/" },
				})
				-- mappings
				vim.cmd([[
          imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
          inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>

          snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
          snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
        ]])
			end,
		})

		-- language server
		use({
			"neovim/nvim-lspconfig",
			ft = {
				"go",
				"python",
				"rust",
				"lua",
				"javascript",
				"html",
				"css",
				"json",
				"typescript",
				"solidity",
				"typescriptreact",
				"javascriptreact",
				"move",
			},
			config = function()
				require("wplai.lsp")
			end,
		})
		-- visualize lsp progress
		use({
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup({})
			end,
		})

		-- outline
		use({
			"simrat39/symbols-outline.nvim",
			ft = { "go", "rust", "lua", "javascript", "typescript", "solidity", "markdown" },
			config = function()
				require("symbols-outline").setup()
				vim.keymap.set("n", "gO", ":SymbolsOutline<CR>")
			end,
		})

		-- diagnostics
		use({
			"folke/trouble.nvim",
			config = function()
				require("trouble").setup({})
			end,
		})

		-- Rust
		use({
			"saecki/crates.nvim",
			tag = "v0.3.0",
			event = "BufRead Cargo.toml",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("crates").setup()
			end,
		})

		-- json
		use({
			"gennaro-tedesco/nvim-jqx",
			ft = "json",
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
				require("gitsigns").setup({
					on_attach = function(bufnr)
						local gs = package.loaded.gitsigns

						local function map(mode, l, r, opts)
							opts = opts or {}
							opts.buffer = bufnr
							vim.keymap.set(mode, l, r, opts)
						end

						-- Navigation
						map("n", "]c", function()
							if vim.wo.diff then
								return "]c"
							end
							vim.schedule(function()
								gs.next_hunk()
							end)
							return "<Ignore>"
						end, { expr = true })

						map("n", "[c", function()
							if vim.wo.diff then
								return "[c"
							end
							vim.schedule(function()
								gs.prev_hunk()
							end)
							return "<Ignore>"
						end, { expr = true })

						-- Actions
						map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
						map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
						map("n", "<leader>hS", gs.stage_buffer)
						map("n", "<leader>hu", gs.undo_stage_hunk)
						map("n", "<leader>hR", gs.reset_buffer)
						map("n", "<leader>hp", gs.preview_hunk)
						map("n", "<leader>hb", function()
							gs.blame_line({ full = true })
						end)
						map("n", "<leader>tb", gs.toggle_current_line_blame)
						map("n", "<leader>hd", gs.diffthis)
						map("n", "<leader>hD", function()
							gs.diffthis("~")
						end)
						map("n", "<leader>td", gs.toggle_deleted)

						-- Text object
						map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
					end,
				})
			end,
		})
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

		-- easy motion
		use({
			"ggandor/leap.nvim",
			config = function()
				require("leap").add_default_mappings()
			end,
		})

		-- move language
		use({ "modocache/move.vim" })
	end,
})
