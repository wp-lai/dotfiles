local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm(),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	}),
	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "treesitter" },
		{ name = "path" },
		{ name = "rg" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "nvim_lsp_signature_help" },
	},

	-- mapping = {
	-- 	["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
	-- 	["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	-- 	["<C-y>"] = cmp.mapping.confirm({
	-- 		select = true,
	-- 	}),
	-- 	["<C-e>"] = cmp.mapping({
	-- 		i = cmp.mapping.abort(),
	-- 		c = cmp.mapping.close(),
	-- 	}),
	-- 	["<CR>"] = cmp.mapping.confirm(),
	-- 	["<Tab>"] = function(fallback)
	-- 		if cmp.visible() then
	-- 			cmp.select_next_item()
	-- 		elseif luasnip.expand_or_jumpable() then
	-- 			luasnip.expand_or_jump()
	-- 		else
	-- 			fallback()
	-- 		end
	-- 	end,
	-- 	["<S-Tab>"] = function(fallback)
	-- 		if cmp.visible() then
	-- 			cmp.select_prev_item()
	-- 		elseif luasnip.jumpable(-1) then
	-- 			luasnip.jump(-1)
	-- 		else
	-- 			fallback()
	-- 		end
	-- 	end,
	-- },
	-- preselect = cmp.PreselectMode.None,
	-- formatting = {
	-- 	format = require("lspkind").cmp_format({
	-- 		with_text = true,
	-- 		maxwidth = 50,
	-- 		menu = {
	-- 			buffer = "[buf]",
	-- 			nvim_lsp = "[LSP]",
	-- 			nvim_lua = "[api]",
	-- 			path = "[path]",
	-- 			luasnip = "[snip]",
	-- 		},
	-- 	}),
	-- },
	-- experimental = {
	-- 	native_menu = false,
	-- 	ghost_text = false,
	-- },
	-- sorting = {
	-- 	comparators = {
	-- 		compare.offset,
	-- 		compare.exact,
	-- 		compare.score,
	-- 		compare.recently_used,
	-- 		lspkind_comparator({
	-- 			kind_priority = {
	-- 				Field = 11,
	-- 				Property = 11,
	-- 				Constant = 10,
	-- 				Enum = 10,
	-- 				EnumMember = 10,
	-- 				Event = 10,
	-- 				Function = 10,
	-- 				Method = 10,
	-- 				Operator = 10,
	-- 				Reference = 10,
	-- 				Struct = 10,
	-- 				Variable = 12,
	-- 				File = 8,
	-- 				Folder = 8,
	-- 				Class = 5,
	-- 				Color = 5,
	-- 				Module = 5,
	-- 				Keyword = 2,
	-- 				Constructor = 1,
	-- 				Interface = 1,
	-- 				Snippet = 0,
	-- 				Text = 1,
	-- 				TypeParameter = 1,
	-- 				Unit = 1,
	-- 				Value = 1,
	-- 			},
	-- 		}),
	-- 		label_comparator,
	-- 		compare.kind,
	-- 		compare.sort_text,
	-- 		compare.length,
	-- 		compare.order,
	-- 	},
	-- },
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "nvim_lsp_document_symbol" },
	}, {
		{ name = "buffer" },
	}),
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- local compare = require("cmp.config.compare")
-- -- luasnip
-- local luasnip = require("luasnip")
--
-- local WIDE_HEIGHT = 80
--
-- -- sort items inside lsp source
-- local lspkind_comparator = function(conf)
-- 	local lsp_types = require("cmp.types").lsp
-- 	return function(entry1, entry2)
-- 		if entry1.source.name ~= "nvim_lsp" then
-- 			if entry2.source.name == "nvim_lsp" then
-- 				return false
-- 			else
-- 				return nil
-- 			end
-- 		end
-- 		local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
-- 		local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]
--
-- 		local priority1 = conf.kind_priority[kind1] or 0
-- 		local priority2 = conf.kind_priority[kind2] or 0
-- 		if priority1 == priority2 then
-- 			return nil
-- 		end
-- 		return priority2 < priority1
-- 	end
-- end
--
-- local label_comparator = function(entry1, entry2)
-- 	return entry1.completion_item.label < entry2.completion_item.label
-- end
