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

		-- aesthetics
		use({
			"sainnhe/gruvbox-material",
			disable = true,
			setup = function()
				vim.o.termguicolors = true
				vim.g.gruvbox_material_better_performance = 1
			end,
			config = function()
				vim.cmd([[colorscheme gruvbox-material]])
			end,
		})
		use({
			"rebelot/kanagawa.nvim",
			disable = true,
			config = function()
				vim.cmd("colorscheme kanagawa")
			end,
		})
		use({
			"rmehri01/onenord.nvim",
			disable = true,
			config = function()
				vim.cmd("colorscheme onenord")
				vim.cmd([[highlight Normal guibg=none]])
				vim.cmd([[highlight NoneText guibg=none]])
			end,
		})
		use({
			"catppuccin/nvim",
			as = "catppuccin",
			run = ":CatppuccinCompile",
			config = function()
				require("catppuccin").setup({
					transparent_background = true,
					term_colors = true,
					-- dim_inactive = {
					-- 	enabled = true,
					-- 	shade = "dark",
					-- 	percentage = 0.15,
					-- },
					compile = {
						enabled = true,
						path = vim.fn.stdpath("cache") .. "/catppuccin",
						suffix = "_compiled",
					},
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
				-- vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
				vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
				vim.cmd([[colorscheme catppuccin]])
			end,
		})
		use({
			"shaunsingh/oxocarbon.nvim",
			run = "./install.sh",
			disable = true,
			config = function()
				vim.cmd("colorscheme oxocarbon")
			end,
		})
		use({
			"luisiacc/gruvbox-baby",
			disable = true,
			config = function()
				vim.g.gruvbox_baby_transparent_mode = 1
				vim.cmd("colorscheme gruvbox-baby")
			end,
		})

		use({ "stevearc/dressing.nvim" })
		use({
			"hood/popui.nvim",
			requires = {
				"RishabhRD/popfix",
			},
			config = function()
				vim.ui.select = require("popui.ui-overrider")
				vim.ui.input = require("popui.input-overrider")
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
			config = function()
				require("indent_blankline").setup({
					show_current_context = true,
					show_current_context_start = true,
				})
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
		use({ "lewis6991/impatient.nvim" })

		-- utilities
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			cmd = "NvimTreeToggle",
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
				vim.api.nvim_set_keymap("n", "<leader>tr", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
			end,
		})
		use({
			"kevinhwang91/nvim-ufo",
			requires = "kevinhwang91/promise-async",
			config = function()
				vim.keymap.set("n", "zR", require("ufo").openAllFolds)
				vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
				require("ufo").setup({
					provider_selector = function(bufnr, filetype, buftype)
						return { "treesitter", "indent" }
					end,
					open_fold_hl_timeout = 150,
					preview = {
						win_config = {
							border = { "", "─", "", "", "", "─", "", "" },
							winhighlight = "Normal:Folded",
							winblend = 0,
						},
						mappings = {
							scrollU = "<C-u>",
							scrollD = "<C-d>",
						},
					},
					fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
						local newVirtText = {}
						local suffix = ("  %d "):format(endLnum - lnum)
						local sufWidth = vim.fn.strdisplaywidth(suffix)
						local targetWidth = width - sufWidth
						local curWidth = 0
						for _, chunk in ipairs(virtText) do
							local chunkText = chunk[1]
							local chunkWidth = vim.fn.strdisplaywidth(chunkText)
							if targetWidth > curWidth + chunkWidth then
								table.insert(newVirtText, chunk)
							else
								chunkText = truncate(chunkText, targetWidth - curWidth)
								local hlGroup = chunk[2]
								table.insert(newVirtText, { chunkText, hlGroup })
								chunkWidth = vim.fn.strdisplaywidth(chunkText)
								-- str width returned from truncate() may less than 2nd argument, need padding
								if curWidth + chunkWidth < targetWidth then
									suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
								end
								break
							end
							curWidth = curWidth + chunkWidth
						end
						table.insert(newVirtText, { suffix, "MoreMsg" })
						return newVirtText
					end,
				})
			end,
		})
		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup()
			end,
		})

		use({
			"JoseConseco/iswap.nvim",
			config = function()
				vim.api.nvim_set_keymap("n", "<m-h>", "<cmd>ISwapCursorNodeLeft<CR>", { noremap = true, silent = true }) -- move cursor node right
				vim.api.nvim_set_keymap(
					"n",
					"<m-l>",
					"<cmd>ISwapCursorNodeRight<CR>",
					{ noremap = true, silent = true }
				) -- move cursor node left
			end,
		})

		-- marks
		use({
			"chentoast/marks.nvim",
			config = function()
				require("marks").setup()
			end,
		})

		-- debugger
		-- use({ "mfussenegger/nvim-dap", config = [[ require"wplai.dap"]] })
		-- use("rcarriga/nvim-dap-ui")
		-- use({
		-- 	"theHamsta/nvim-dap-virtual-text",
		-- 	config = function()
		-- 		require("nvim-dap-virtual-text").setup({})
		-- 	end,
		-- })

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
			end,
		})

		use({
			"Djancyp/better-comments.nvim",
			disable = true,
			config = function()
				require("better-comment").Setup()
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
			tag = "0.1.0",
			requires = "nvim-lua/plenary.nvim",
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
		use({
			"smartpde/telescope-recent-files",
			config = function()
				require("telescope").load_extension("recent_files")
				vim.api.nvim_set_keymap(
					"n",
					"<Leader>rr",
					[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
					{ noremap = true, silent = true }
				)
			end,
		})
		-- use({
		-- 	"nvim-telescope/telescope-dap.nvim",
		-- 	config = function()
		-- 		require("telescope").load_extension("dap")
		-- 	end,
		-- })

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
				{
					"nvim-treesitter/nvim-treesitter-context",
				},
			},
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
			config = [[ require("wplai.nvim-cmp") ]],
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
			},
			config = [[ require"wplai.lsp" ]],
		})
		use({
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup({})
			end,
		})

		-- tab
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.*",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("bufferline").setup()
				vim.opt.termguicolors = true
				vim.api.nvim_set_keymap("n", "]b", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
				vim.api.nvim_set_keymap("n", "[b", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
			end,
		})

		-- outline
		use({
			"simrat39/symbols-outline.nvim",
			ft = { "go", "rust", "lua", "javascript", "typescript", "solidity" },
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
			tag = "v1.*",
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

		-- Rust
		use({
			"saecki/crates.nvim",
			tag = "v0.3.0",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("crates").setup()
			end,
		})
		use({
			"simrat39/rust-tools.nvim",
			disable = true,
			ft = "rust",
			config = function()
				local rust_opts = {
					server = {
						standalone = false,
						on_attach = function(client, bufnr)
							vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
							local opts = { noremap = true, silent = true }
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"gd",
								"<cmd>lua vim.lsp.buf.declaration()<cr>",
								opts
							)
							vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<C-]>",
								"<cmd>lua vim.lsp.buf.implementation()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"K",
								"<cmd>lua require'rust-tools.hover_actions'.hover_actions()",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<C-k>",
								"<cmd>lua vim.lsp.buf.signature_help()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<leader>wa",
								"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<leader>wr",
								"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<leader>wl",
								"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
								opts
							)

							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"gD",
								"<cmd>lua vim.lsp.buf.declaration()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
							vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"gi",
								"<cmd>lua vim.lsp.buf.implementation()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<C-k>",
								"<cmd>lua vim.lsp.buf.signature_help()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<space>wa",
								"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<space>wr",
								"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<space>wl",
								"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<space>D",
								"<cmd>lua vim.lsp.buf.type_definition()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<space>rn",
								"<cmd>lua vim.lsp.buf.rename()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<space>ca",
								"<cmd>lua vim.lsp.buf.code_action()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<space>f",
								"<cmd>lua vim.lsp.buf.formatting()<CR>",
								opts
							)

							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<space>e",
								"<cmd>lua vim.diagnostic.open_float()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"[d",
								"<cmd>lua vim.diagnostic.goto_prev()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"]d",
								"<cmd>lua vim.diagnostic.goto_next()<CR>",
								opts
							)
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<space>q",
								"<cmd>lua vim.diagnostic.setloclist()<CR>",
								opts
							)

							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"<space>rr",
								"<cmd>lua require('rust-tools.runnables').runnables()<CR>",
								opts
							)
						end,
					},
				}

				require("rust-tools").setup(rust_opts)
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
			requires = "nvim-lua/plenary.nvim",
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
					package_manager = "pnpm",
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
		use({
			"ggandor/leap.nvim",
			config = function()
				require("leap").add_default_mappings()
			end,
		})
	end,
})
