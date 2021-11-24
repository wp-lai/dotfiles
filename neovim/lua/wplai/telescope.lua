require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["q"] = require("telescope.actions").close,
			},
			i = {
				["<esc>"] = require("telescope.actions").close,
			},
		},
		defaults = {
			history = {
				path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
				limit = 100,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "ivy",
		},
		oldfiles = {
			theme = "ivy",
		},
		buffers = {
			sort_lastused = true,
			theme = "ivy",
		},
		live_grep = {
			prompt_prefix = "🔍",
			theme = "ivy",
		},
		current_buffer_fuzzy_find = {
			prompt_prefix = "🔍",
			theme = "ivy",
		},
		file_browser = {
			theme = "ivy",
		},
		lsp_references = {
			theme = "ivy",
		},
		lsp_implementations = {
			theme = "ivy",
		},
		lsp_definitions = {
			theme = "ivy",
		},
		lsp_document_symbols = {
			theme = "ivy",
		},
		lsp_workspace_diagnostics = {
			theme = "ivy",
		},
		lsp_document_diagnostics = {
			theme = "ivy",
		},
		treesitter = {
			theme = "ivy",
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = false, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		-- project = {
		-- 	base_dirs = {
		-- 		"/Users/wplai/workspace/FlightSurety-Dapp/flightsurety-contract",
		-- 		"/Users/wplai/workspace/FlightSurety-Dapp/flightsurety-app",
		-- 	},
		-- },
	},
})

-- keymaps
local map = vim.api.nvim_set_keymap
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", { noremap = true })
map("n", "<leader>wg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
map("n", "<leader>bb", "<cmd>lua require('telescope.builtin').buffers{shorten_path = false}<CR>", { noremap = true })
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').file_browser()<CR>", { noremap = true })
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true })
map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", { noremap = true })
map("n", "<leader>en", "<cmd>lua require('telescope.builtin').find_files{cwd='~/.config/nvim'}<CR>", { noremap = true })

-- lsp related
map("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", { noremap = true })
map("n", "<C-]>", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", { noremap = true })
-- map("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", {noremap = true})
map(
	"n",
	"<leader>ca",
	"<cmd>lua require('telescope.builtin').lsp_code_actions(require'telescope.themes'.get_dropdown { winblend = 10, border = true, previewer = false, shorten_path = false})<CR>",
	{ noremap = true }
)
map(
	"v",
	"<leader>ca",
	"<cmd>lua require('telescope.builtin').lsp_range_code_actions(require'telescope.themes'.get_dropdown { winblend = 10, border = true, previewer = false, shorten_path = false})<CR>",
	{ noremap = true }
)
-- map("n", "<leader>fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", {noremap = true})
map("n", "<leader>fs", "<cmd>lua require('telescope.builtin').treesitter()<CR>", { noremap = true })
map("n", "<leader>ws", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", { noremap = true })
map("n", "<leader>fd", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>", { noremap = true })
map("n", "<leader>wd", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>", { noremap = true })
