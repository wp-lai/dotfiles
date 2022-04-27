-- -- protocol symbols
-- vim.lsp.protocol.CompletionItemKind = {
-- 	"", -- Text
-- 	"", -- Method
-- 	"", -- Function
-- 	"", -- Constructor
-- 	"ﰠ", -- Field
-- 	"", -- Variable
-- 	"", -- Class
-- 	"", -- Interface
-- 	"", -- Module
-- 	"", -- Property
-- 	"", -- Unit
-- 	"", -- Value
-- 	"", -- Enum
-- 	"", -- Keyword
-- 	"", -- Snippet
-- 	"", -- Color
-- 	"", -- File
-- 	"", -- Reference
-- 	"", -- Folder
-- 	"", -- EnumMember
-- 	"", -- Constant
-- 	"", -- Struct
-- 	"⌘", -- Event
-- 	"", -- Operator
-- 	"", -- TypeParameter
-- }
--
-- -- options for lsp diagnostic
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 	underline = true,
-- 	signs = true,
-- 	update_in_insert = true,
-- 	virtual_text = {
-- 		true,
-- 		spacing = 6,
-- 		source = "always",
-- 		--severity_limit='Error'  -- Only show virtual text on error
-- 	},
-- })

-- -- go_to_definition in a split window
-- local function goto_definition(split_cmd)
-- 	local util = vim.lsp.util
-- 	local log = require("vim.lsp.log")
-- 	local api = vim.api
--
-- 	local handler = function(_, method, result)
-- 		-- stolen from $VIMRUNTIME/lua/vim/lsp/callbacks.lua
--
-- 		if result == nil or vim.tbl_isempty(result) then
-- 			local _ = log.info() and log.info(method, "No location found")
-- 			return nil
-- 		end
--
-- 		if split_cmd then
-- 			vim.cmd(split_cmd)
-- 		end
--
-- 		if vim.tbl_islist(result) then
-- 			util.jump_to_location(result[1])
--
-- 			if #result > 1 then
-- 				util.set_qflist(util.locations_to_items(result))
-- 				api.nvim_command("copen")
-- 				api.nvim_command("wincmd p")
-- 			end
-- 		else
-- 			util.jump_to_location(result)
-- 		end
-- 	end
--
-- 	return handler
-- end
--
-- vim.lsp.handlers["textDocument/definition"] = goto_definition("split")

-- vim.fn.sign_define("LspDiagnosticsSignError", {
-- 	text = "◉",
-- 	texthl = "LspDiagnosticsDefaultError",
-- 	numhl = "LspDiagnosticsDefaultError",
-- })
-- vim.fn.sign_define("LspDiagnosticsSignWarning", {
-- 	text = "●",
-- 	texthl = "LspDiagnosticsDefaultWarning",
-- 	numhl = "LspDiagnosticsDefaultWarning",
-- })
-- vim.fn.sign_define("LspDiagnosticsSignInformation", {
-- 	text = "•",
-- 	texthl = "LspDiagnosticsDefaultInformation",
-- 	numhl = "LspDiagnosticsDefaultInformation",
-- })
-- vim.fn.sign_define("LspDiagnosticsSignHint", {
-- 	text = "·",
-- 	texthl = "LspDiagnosticsDefaultHint",
-- 	numhl = "LspDiagnosticsDefaultHint",
-- })
-- vim.fn.sign_define("LightBulbSign", {
-- 	text = "◎",
-- 	texthl = "LightBulb",
-- 	linehl = "",
-- 	numhl = "",
-- })

-- -- se LSP diagnostic symbols/signs
-- vim.api.nvim_command(
-- 	[[ sign define LspDiagnosticsSignError         text=✗ texthl=LspDiagnosticsSignError       linehl= numhl= ]]
-- )
-- vim.api.nvim_command(
-- 	[[ sign define LspDiagnosticsSignWarning       text=⚠ texthl=LspDiagnosticsSignWarning     linehl= numhl= ]]
-- )
-- vim.api.nvim_command(
-- 	[[ sign define LspDiagnosticsSignInformation   text= texthl=LspDiagnosticsSignInformation linehl= numhl= ]]
-- )
-- vim.api.nvim_command(
-- 	[[ sign define LspDiagnosticsSignHint          text= texthl=LspDiagnosticsSignHint        linehl= numhl= ]]
-- )
--
-- vim.cmd([[
-- sign define DiagnosticSignError text= linehl= texthl=DiagnosticSignError numhl=
-- sign define DiagnosticSignWarn text= linehl= texthl=DiagnosticSignWarn numhl=
-- sign define DiagnosticSignInfo text= linehl= texthl=DiagnosticSignInfo numhl=
-- sign define DiagnosticSignHint text=💡 linehl= texthl=DiagnosticSignHint numhl= ]])

local nvim_lsp = require("lspconfig")
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-]>", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<space>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

	-- print('LSP attached.')
	vim.api.nvim_echo({ { "LSP attached." } }, false, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = { "tsserver", "html", "cssls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = { debounce_text_changes = 150 },
	})
end

-- go
nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = { debounce_text_changes = 150 },
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
})

-- rust
nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = { debounce_text_changes = 150 },
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "self",
			},
		},
	},
	-- settings = {
	-- 	["rust-analyzer"] = {
	-- 		checkOnSave = {
	-- 			allFeatures = true,
	-- 			overrideCommand = {
	-- 				"cargo",
	-- 				"clippy",
	-- 				"--workspace",
	-- 				"--message-format=json",
	-- 				"--all-targets",
	-- 				"--all-features",
	-- 			},
	-- 		},
	-- 	},
	-- },
})

-- solidity
nvim_lsp.solidity_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = { debounce_text_changes = 150 },
	cmd = { "solidity-language-server", "--stdio" },
	filetypes = { "solidity" },
	root_dir = nvim_lsp.util.root_pattern(".git", "hardhat.config.ts", "hardhat.config.js", "foundry.toml"),
})

-- json
nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = { debounce_text_changes = 150 },
	settings = {
		json = {
			schemas = {
				fileMatch = { "package.json" },
				url = "https://json.schemastore.org/package.json",
			},
		},
	},
})

-- lua language-server
-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = { debounce_text_changes = 150 },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "hs" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
