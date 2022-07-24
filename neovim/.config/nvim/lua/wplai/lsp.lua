local nvim_lsp = require("lspconfig")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<C-]>", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

	-- print('LSP attached.')
	vim.api.nvim_echo({ { "LSP attached." } }, false, {})
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.foldingRange = {
-- 	dynamicRegistration = false,
-- 	lineFoldingOnly = true,
-- }
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { "html", "cssls", "graphql" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- go
nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = { debounce_text_changes = 150 },
})

-- rust
nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json"),
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

-- tsserver
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		lint = true,
		hostInfo = "neovim",
	},
})

nvim_lsp.eslint.setup({})

-- -- deno
-- nvim_lsp.denols.setup({
-- 	on_attach = on_attach,
-- 	root_dir = nvim_lsp.util.root_pattern("deno.json"),
-- 	init_options = {
-- 		lint = true,
-- 	},
-- })

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
