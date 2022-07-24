-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/wplai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/wplai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/wplai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/wplai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/wplai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nr\0\0\3\0\6\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0025\1\5\0=\1\4\0K\0\1\0\1\3\0\0\n// %s\v/*%s*/\rsolidity\15Comment.ft\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { ' require("wplai.snippet") ' },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    config = { "\27LJ\2\n„\2\0\0\a\0\19\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0006\4\a\0009\4\b\0049\4\t\4'\6\n\0B\4\2\2'\5\v\0&\4\5\4=\4\f\3=\3\r\2B\0\2\0016\0\a\0009\0\14\0'\1\16\0=\1\15\0006\0\a\0009\0\17\0'\2\18\0B\0\2\1K\0\1\0\27colorscheme catppuccin\bcmd\vfrappe\23catppuccin_flavour\6g\fcompile\tpath\16/catppuccin\ncache\fstdpath\afn\bvim\1\0\2\fenabled\2\vsuffix\14_compiled\17dim_inactive\1\0\3\fenabled\2\nshade\tdark\15percentage\4≥ÊÃô\3≥Êå˛\3\1\0\1\27transparent_background\2\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nÄ\1\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\21--stdin-filepath\1\0\2\nstdin\2\bexe\rprettier\5ÄÄ¿ô\4S\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0!--emit=stdout --edition=2021\1\0\2\nstdin\2\bexe\frustfmt7\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\6-\1\0\2\nstdin\2\bexe\vstylua#\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\ngofmt\nstdin\2ã\3\1\0\a\0\26\00003\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0005\4\5\0004\5\3\0>\0\1\5=\5\6\0044\5\3\0>\0\1\5=\5\a\0044\5\3\0>\0\1\5=\5\b\0044\5\3\0>\0\1\5=\5\t\0044\5\3\0>\0\1\5=\5\n\0044\5\3\0>\0\1\5=\5\v\0044\5\3\0003\6\f\0>\6\1\5=\5\r\0044\5\3\0003\6\14\0>\6\1\5=\5\15\0044\5\3\0003\6\16\0>\6\1\5=\5\17\4=\4\18\3B\1\2\0016\1\19\0009\1\20\0019\1\21\1'\3\22\0'\4\23\0'\5\24\0005\6\25\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\20<cmd>Format<CR>\14<leader>=\6n\20nvim_set_keymap\bapi\bvim\rfiletype\ago\0\blua\0\trust\0\rsolidity\tjson\20typescriptreact\20javascriptreact\15typescript\15javascript\1\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21wplai.statusline\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbuffer#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthisƒ\5\1\1\t\0&\0N6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\5\4\0'\6\5\0003\a\6\0005\b\a\0B\3\5\1\18\3\2\0'\5\4\0'\6\b\0003\a\t\0005\b\n\0B\3\5\1\18\3\2\0005\5\v\0'\6\f\0'\a\r\0B\3\4\1\18\3\2\0005\5\14\0'\6\15\0'\a\16\0B\3\4\1\18\3\2\0'\5\4\0'\6\17\0009\a\18\1B\3\4\1\18\3\2\0'\5\4\0'\6\19\0009\a\20\1B\3\4\1\18\3\2\0'\5\4\0'\6\21\0009\a\22\1B\3\4\1\18\3\2\0'\5\4\0'\6\23\0009\a\24\1B\3\4\1\18\3\2\0'\5\4\0'\6\25\0003\a\26\0B\3\4\1\18\3\2\0'\5\4\0'\6\27\0009\a\28\1B\3\4\1\18\3\2\0'\5\4\0'\6\29\0009\a\30\1B\3\4\1\18\3\2\0'\5\4\0'\6\31\0003\a \0B\3\4\1\18\3\2\0'\5\4\0'\6!\0009\a\"\1B\3\4\1\18\3\2\0005\5#\0'\6$\0'\a%\0B\3\4\0012\0\0ÄK\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\19toggle_deleted\15<leader>td\0\15<leader>hD\rdiffthis\15<leader>hd\30toggle_current_line_blame\15<leader>tb\0\15<leader>hb\17preview_hunk\15<leader>hp\17reset_buffer\15<leader>hR\20undo_stage_hunk\15<leader>hu\17stage_buffer\15<leader>hS\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\1\0\1\texpr\2\0\a[c\1\0\1\texpr\2\0\a]c\6n\0\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["iswap.nvim"] = {
    config = { "\27LJ\2\n‘\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\"<cmd>ISwapCursorNodeRight<CR>\n<m-l>\1\0\2\fnoremap\2\vsilent\2!<cmd>ISwapCursorNodeLeft<CR>\n<m-h>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/iswap.nvim",
    url = "https://github.com/JoseConseco/iswap.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  neogit = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { ' require("wplai.nvim-cmp") ' },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-jqx"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/nvim-jqx",
    url = "https://github.com/gennaro-tedesco/nvim-jqx"
  },
  ["nvim-lspconfig"] = {
    config = { ' require"wplai.lsp" ' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n≤\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\24:NvimTreeToggle<cr>\n<C-p>\6n\20nvim_set_keymap\bapi\bvim\1\0\1\15update_cwd\2\nsetup\14nvim-tree\frequire\0" },
    keys = { { "", "<C-p>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { " require('wplai.treesitter') " },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-ufo"] = {
    config = { "\27LJ\2\n˘\2\0\5\23\0\v\0I4\5\0\0'\6\0\0\18\b\6\0009\6\1\6!\t\1\2B\6\3\0026\a\2\0009\a\3\a9\a\4\a\18\t\6\0B\a\2\2!\b\a\3)\t\0\0006\n\5\0\18\f\0\0B\n\2\4X\r/Ä:\15\1\0146\16\2\0009\16\3\0169\16\4\16\18\18\15\0B\16\2\2 \17\16\t\1\17\b\0X\17\6Ä6\17\6\0009\17\a\17\18\19\5\0\18\20\14\0B\17\3\1X\17\31Ä\18\17\4\0\18\19\15\0!\20\t\bB\17\3\2\18\15\17\0:\17\2\0146\18\6\0009\18\a\18\18\20\5\0004\21\3\0>\15\1\21>\17\2\21B\18\3\0016\18\2\0009\18\3\0189\18\4\18\18\20\15\0B\18\2\2\18\16\18\0 \18\16\t\1\18\b\0X\18\fÄ\18\18\6\0'\19\b\0\18\21\19\0009\19\t\19!\22\t\b!\22\16\22B\19\3\2&\6\19\18X\n\3Ä \t\16\tE\r\3\3R\rœ\1276\n\6\0009\n\a\n\18\f\5\0005\r\n\0>\6\1\rB\n\3\1L\5\2\0\1\3\0\0\0\fMoreMsg\brep\6 \vinsert\ntable\vipairs\20strdisplaywidth\afn\bvim\vformat\r ÔïÅ %d X\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\27fold_virt_text_handler\1\0\0\0\nsetup\bufo\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nÔ\5\0\0\5\0\"\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2 \0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\3=\3!\2B\0\2\1K\0\1\0\roverride\1\0\0\bzsh\1\0\3\ncolor\f#428850\tname\bZsh\ticon\bÓûï\bzip\1\0\3\ncolor\f#EBCB8B\tname\bzip\ticon\bÔáÜ\axz\1\0\3\ncolor\f#EBCB8B\tname\axz\ticon\bÔáÜ\ats\1\0\3\ncolor\f#519ABA\tname\ats\ticon\bÔØ§\ttoml\1\0\3\ncolor\f#61afef\tname\ttoml\ticon\bÔÄì\bpng\1\0\3\ncolor\f#BD77DC\tname\bpng\ticon\tÔÄæ \bout\1\0\3\ncolor\f#C8CCD4\tname\bout\ticon\bÓòí\bmp4\1\0\3\ncolor\f#C8CCD4\tname\bmp4\ticon\bÔÖÑ\bmp3\1\0\3\ncolor\f#C8CCD4\tname\bmp3\ticon\bÔ¢Ö\ajs\1\0\3\ncolor\f#EBCB8B\tname\ajs\ticon\bÔ†ù\bjpg\1\0\3\ncolor\f#BD77DC\tname\bjpg\ticon\tÔÄæ \tjpeg\1\0\3\ncolor\f#BD77DC\tname\tjpeg\ticon\tÔÄæ \thtml\1\0\3\ncolor\f#DE8C92\tname\thtml\ticon\bÔÑª\bcss\1\0\0\1\0\3\ncolor\f#61afef\tname\bcss\ticon\bÓùâ\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    config = { "\27LJ\2\n£\2\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0Ò\1          augroup packer_user_config\n            autocmd!\n            autocmd BufWritePost plugins.lua source <afile> | PackerCompile\n            autocmd User PackerCompileDone echom 'PackerCompile done'\n          augroup end\n          \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/popfix",
    url = "https://github.com/RishabhRD/popfix"
  },
  ["popui.nvim"] = {
    config = { "\27LJ\2\nÄ\1\0\0\4\0\a\0\r6\0\0\0009\0\1\0006\1\3\0'\3\4\0B\1\2\2=\1\2\0006\0\0\0009\0\1\0006\1\3\0'\3\6\0B\1\2\2=\1\5\0K\0\1\0\26popui.input-overrider\ninput\23popui.ui-overrider\frequire\vselect\aui\bvim\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/popui.nvim",
    url = "https://github.com/hood/popui.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\nÈ\16\0\2\n\0003\0Û\0016\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0015\2\5\0006\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\b\0'\b\t\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\n\0'\b\v\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\f\0'\b\r\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\14\0'\b\15\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\16\0'\b\17\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\18\0'\b\19\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\20\0'\b\21\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\22\0'\b\23\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\n\0'\b\24\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\b\0'\b\25\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\14\0'\b\26\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\27\0'\b\r\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\16\0'\b\17\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\28\0'\b\19\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\29\0'\b\21\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\30\0'\b\23\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a\31\0'\b \0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a!\0'\b\"\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a#\0'\b$\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a%\0'\b&\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a'\0'\b(\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a)\0'\b*\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a+\0'\b,\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a-\0'\b.\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a/\0'\b0\0\18\t\2\0B\3\6\0016\3\0\0009\3\1\0039\3\6\3\18\5\1\0'\6\a\0'\a1\0'\b2\0\18\t\2\0B\3\6\1K\0\1\0=<cmd>lua require('rust-tools.runnables').runnables()<CR>\14<space>rr-<cmd>lua vim.diagnostic.setloclist()<CR>\r<space>q,<cmd>lua vim.diagnostic.goto_next()<CR>\a]d,<cmd>lua vim.diagnostic.goto_prev()<CR>\a[d-<cmd>lua vim.diagnostic.open_float()<CR>\r<space>e*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>D\14<space>wl\14<space>wr\14<space>wa\agi%<cmd>lua vim.lsp.buf.hover()<CR>*<cmd>lua vim.lsp.buf.definition()<CR>+<cmd>lua vim.lsp.buf.declaration()<CR>J<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\15<leader>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\15<leader>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\15<leader>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>?<cmd>lua require'rust-tools.hover_actions'.hover_actions()\6K.<cmd>lua vim.lsp.buf.implementation()<CR>\n<C-]>*<cmd>lua vim.lsp.buf.definition()<cr>\agD+<cmd>lua vim.lsp.buf.declaration()<cr>\agd\6n\24nvim_buf_set_keymap\1\0\2\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimt\1\0\4\0\b\0\f5\0\3\0005\1\0\0003\2\1\0=\2\2\1=\1\4\0006\1\5\0'\3\6\0B\1\2\0029\1\a\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\15rust-tools\frequire\vserver\1\0\0\14on_attach\0\1\0\1\15standalone\1\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["startuptime.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/startuptime.vim",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\np\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\24:SymbolsOutline<CR>\agO\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-zoxide"] = {
    config = { "\27LJ\2\nŸ\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\0029:lua require'telescope'.extensions.zoxide.list{}<CR>\15<leader>fz\6n\20nvim_set_keymap\bapi\bvim\vzoxide\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/telescope-zoxide",
    url = "https://github.com/jvgrootveld/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    config = { ' require("wplai.telescope") ' },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nß\5\0\0\6\0\28\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\25\0'\4\26\0005\5\27\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2$<cmd>TroubleToggle quickfix<CR>\14<space>xq\1\0\2\fnoremap\2\vsilent\0024<cmd>TroubleToggle lsp_document_diagnostics<CR>\14<space>xb\1\0\2\fnoremap\2\vsilent\0025<cmd>TroubleToggle lsp_workspace_diagnostics<CR>\14<space>xw\1\0\2\fnoremap\2\vsilent\2\27<cmd>TroubleToggle<CR>\14<space>xx\6n\20nvim_set_keymap\bapi\bvim\16action_keys\16toggle_fold\1\2\0\0\n<tab>\tjump\1\0\0\1\2\0\0\t<cr>\nsigns\1\0\5\nerror\bÔÅó\thint\bÔââ\16information\bÔÅö\nother\bÔÅò\fwarning\bÔÅ±\1\0\3\16fold_closed\b‚ñ∏\17indent_lines\1\14fold_open\b‚ñæ\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n«\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\"<C-\\><C-n>:FloatermToggle<CR>\6t\1\0\2\fnoremap\2\vsilent\2\24:FloatermToggle<CR>\n<M-d>\6n\20nvim_set_keymap\bapi\bvim\0" },
    keys = { { "", "<M-d>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-maximizer"] = {
    keys = { { "", "<F3>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-searchindex"] = {
    keys = { { "", "/" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/vim-searchindex",
    url = "https://github.com/google/vim-searchindex"
  },
  ["vim-solidity"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/opt/vim-solidity",
    url = "https://github.com/tomlion/vim-solidity"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/wplai/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nù\5\0\0\2\0\16\0%6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0+\1\1\0=\1\n\0006\0\0\0009\0\1\0+\1\1\0=\1\v\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0+\1\2\0=\1\r\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0K\0\1\0\1\16\0\0\nclass\vreturn\rfunction\vmethod\b^if\t^for\v^while\nblock\14arguments\17if_statement\16else_clause\18try_statement\17catch_clause\21import_statement\19operation_type&indent_blankline_context_patterns*indent_blankline_show_current_context$indent_blankline_use_treesitter-indent_blankline_show_first_indent_level4indent_blankline_show_trailing_blankline_indent\6  indent_blankline_space_char\6|\26indent_blankline_char\1\2\0\0\rterminal%indent_blankline_buftype_exclude\1\4\0\0\thelp\vpacker\20TelescopePrompt&indent_blankline_filetype_exclude\6g\bvim\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
time([[packadd for indent-blankline.nvim]], true)
vim.cmd [[packadd indent-blankline.nvim]]
time([[packadd for indent-blankline.nvim]], false)
-- Setup for: symbols-outline.nvim
time([[Setup for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\6\0\a6\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\1=\1\2\0K\0\1\0\fkeymaps\1\0\0\1\0\1\nclose\6q\20symbols_outline\6g\bvim\0", "setup", "symbols-outline.nvim")
time([[Setup for symbols-outline.nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n√\1\0\0\3\0\b\0\t6\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\1=\1\2\0K\0\1\0\vfolder\1\0\2\fdefault\bÓóø\topen\bÓóæ\bgit\1\0\5\runstaged\b‚úó\vstaged\b‚úì\14untracked\b‚òÖ\runmerged\bÓúß\frenamed\b‚ûú\1\0\2\fdefault\tÓòí \fsymlink\tÔíÅ \20nvim_tree_icons\6g\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: iswap.nvim
time([[Config for iswap.nvim]], true)
try_loadstring("\27LJ\2\n‘\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\"<cmd>ISwapCursorNodeRight<CR>\n<m-l>\1\0\2\fnoremap\2\vsilent\2!<cmd>ISwapCursorNodeLeft<CR>\n<m-h>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "iswap.nvim")
time([[Config for iswap.nvim]], false)
-- Config for: packer.nvim
time([[Config for packer.nvim]], true)
try_loadstring("\27LJ\2\n£\2\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0Ò\1          augroup packer_user_config\n            autocmd!\n            autocmd BufWritePost plugins.lua source <afile> | PackerCompile\n            autocmd User PackerCompileDone echom 'PackerCompile done'\n          augroup end\n          \14nvim_exec\bapi\bvim\0", "config", "packer.nvim")
time([[Config for packer.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbuffer#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthisƒ\5\1\1\t\0&\0N6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\5\4\0'\6\5\0003\a\6\0005\b\a\0B\3\5\1\18\3\2\0'\5\4\0'\6\b\0003\a\t\0005\b\n\0B\3\5\1\18\3\2\0005\5\v\0'\6\f\0'\a\r\0B\3\4\1\18\3\2\0005\5\14\0'\6\15\0'\a\16\0B\3\4\1\18\3\2\0'\5\4\0'\6\17\0009\a\18\1B\3\4\1\18\3\2\0'\5\4\0'\6\19\0009\a\20\1B\3\4\1\18\3\2\0'\5\4\0'\6\21\0009\a\22\1B\3\4\1\18\3\2\0'\5\4\0'\6\23\0009\a\24\1B\3\4\1\18\3\2\0'\5\4\0'\6\25\0003\a\26\0B\3\4\1\18\3\2\0'\5\4\0'\6\27\0009\a\28\1B\3\4\1\18\3\2\0'\5\4\0'\6\29\0009\a\30\1B\3\4\1\18\3\2\0'\5\4\0'\6\31\0003\a \0B\3\4\1\18\3\2\0'\5\4\0'\6!\0009\a\"\1B\3\4\1\18\3\2\0005\5#\0'\6$\0'\a%\0B\3\4\0012\0\0ÄK\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\19toggle_deleted\15<leader>td\0\15<leader>hD\rdiffthis\15<leader>hd\30toggle_current_line_blame\15<leader>tb\0\15<leader>hb\17preview_hunk\15<leader>hp\17reset_buffer\15<leader>hR\20undo_stage_hunk\15<leader>hu\17stage_buffer\15<leader>hS\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\1\0\1\texpr\2\0\a[c\1\0\1\texpr\2\0\a]c\6n\0\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21wplai.statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
 require("wplai.snippet") 
time([[Config for LuaSnip]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
 require('wplai.treesitter') 
time([[Config for nvim-treesitter]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nr\0\0\3\0\6\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0025\1\5\0=\1\4\0K\0\1\0\1\3\0\0\n// %s\v/*%s*/\rsolidity\15Comment.ft\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n„\2\0\0\a\0\19\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0006\4\a\0009\4\b\0049\4\t\4'\6\n\0B\4\2\2'\5\v\0&\4\5\4=\4\f\3=\3\r\2B\0\2\0016\0\a\0009\0\14\0'\1\16\0=\1\15\0006\0\a\0009\0\17\0'\2\18\0B\0\2\1K\0\1\0\27colorscheme catppuccin\bcmd\vfrappe\23catppuccin_flavour\6g\fcompile\tpath\16/catppuccin\ncache\fstdpath\afn\bvim\1\0\2\fenabled\2\vsuffix\14_compiled\17dim_inactive\1\0\3\fenabled\2\nshade\tdark\15percentage\4≥ÊÃô\3≥Êå˛\3\1\0\1\27transparent_background\2\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nß\5\0\0\6\0\28\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\f\0009\0\r\0009\0\14\0'\2\15\0'\3\25\0'\4\26\0005\5\27\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2$<cmd>TroubleToggle quickfix<CR>\14<space>xq\1\0\2\fnoremap\2\vsilent\0024<cmd>TroubleToggle lsp_document_diagnostics<CR>\14<space>xb\1\0\2\fnoremap\2\vsilent\0025<cmd>TroubleToggle lsp_workspace_diagnostics<CR>\14<space>xw\1\0\2\fnoremap\2\vsilent\2\27<cmd>TroubleToggle<CR>\14<space>xx\6n\20nvim_set_keymap\bapi\bvim\16action_keys\16toggle_fold\1\2\0\0\n<tab>\tjump\1\0\0\1\2\0\0\t<cr>\nsigns\1\0\5\nerror\bÔÅó\thint\bÔââ\16information\bÔÅö\nother\bÔÅò\fwarning\bÔÅ±\1\0\3\16fold_closed\b‚ñ∏\17indent_lines\1\14fold_open\b‚ñæ\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
 require("wplai.nvim-cmp") 
time([[Config for nvim-cmp]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
 require("wplai.telescope") 
time([[Config for telescope.nvim]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
try_loadstring("\27LJ\2\n˘\2\0\5\23\0\v\0I4\5\0\0'\6\0\0\18\b\6\0009\6\1\6!\t\1\2B\6\3\0026\a\2\0009\a\3\a9\a\4\a\18\t\6\0B\a\2\2!\b\a\3)\t\0\0006\n\5\0\18\f\0\0B\n\2\4X\r/Ä:\15\1\0146\16\2\0009\16\3\0169\16\4\16\18\18\15\0B\16\2\2 \17\16\t\1\17\b\0X\17\6Ä6\17\6\0009\17\a\17\18\19\5\0\18\20\14\0B\17\3\1X\17\31Ä\18\17\4\0\18\19\15\0!\20\t\bB\17\3\2\18\15\17\0:\17\2\0146\18\6\0009\18\a\18\18\20\5\0004\21\3\0>\15\1\21>\17\2\21B\18\3\0016\18\2\0009\18\3\0189\18\4\18\18\20\15\0B\18\2\2\18\16\18\0 \18\16\t\1\18\b\0X\18\fÄ\18\18\6\0'\19\b\0\18\21\19\0009\19\t\19!\22\t\b!\22\16\22B\19\3\2&\6\19\18X\n\3Ä \t\16\tE\r\3\3R\rœ\1276\n\6\0009\n\a\n\18\f\5\0005\r\n\0>\6\1\rB\n\3\1L\5\2\0\1\3\0\0\0\fMoreMsg\brep\6 \vinsert\ntable\vipairs\20strdisplaywidth\afn\bvim\vformat\r ÔïÅ %d X\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\27fold_virt_text_handler\1\0\0\0\nsetup\bufo\frequire\0", "config", "nvim-ufo")
time([[Config for nvim-ufo]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: telescope-zoxide
time([[Config for telescope-zoxide]], true)
try_loadstring("\27LJ\2\nŸ\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\0029:lua require'telescope'.extensions.zoxide.list{}<CR>\15<leader>fz\6n\20nvim_set_keymap\bapi\bvim\vzoxide\19load_extension\14telescope\frequire\0", "config", "telescope-zoxide")
time([[Config for telescope-zoxide]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nÔ\5\0\0\5\0\"\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2 \0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\3=\3!\2B\0\2\1K\0\1\0\roverride\1\0\0\bzsh\1\0\3\ncolor\f#428850\tname\bZsh\ticon\bÓûï\bzip\1\0\3\ncolor\f#EBCB8B\tname\bzip\ticon\bÔáÜ\axz\1\0\3\ncolor\f#EBCB8B\tname\axz\ticon\bÔáÜ\ats\1\0\3\ncolor\f#519ABA\tname\ats\ticon\bÔØ§\ttoml\1\0\3\ncolor\f#61afef\tname\ttoml\ticon\bÔÄì\bpng\1\0\3\ncolor\f#BD77DC\tname\bpng\ticon\tÔÄæ \bout\1\0\3\ncolor\f#C8CCD4\tname\bout\ticon\bÓòí\bmp4\1\0\3\ncolor\f#C8CCD4\tname\bmp4\ticon\bÔÖÑ\bmp3\1\0\3\ncolor\f#C8CCD4\tname\bmp3\ticon\bÔ¢Ö\ajs\1\0\3\ncolor\f#EBCB8B\tname\ajs\ticon\bÔ†ù\bjpg\1\0\3\ncolor\f#BD77DC\tname\bjpg\ticon\tÔÄæ \tjpeg\1\0\3\ncolor\f#BD77DC\tname\tjpeg\ticon\tÔÄæ \thtml\1\0\3\ncolor\f#DE8C92\tname\thtml\ticon\bÔÑª\bcss\1\0\0\1\0\3\ncolor\f#61afef\tname\bcss\ticon\bÓùâ\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: popui.nvim
time([[Config for popui.nvim]], true)
try_loadstring("\27LJ\2\nÄ\1\0\0\4\0\a\0\r6\0\0\0009\0\1\0006\1\3\0'\3\4\0B\1\2\2=\1\2\0006\0\0\0009\0\1\0006\1\3\0'\3\6\0B\1\2\2=\1\5\0K\0\1\0\26popui.input-overrider\ninput\23popui.ui-overrider\frequire\vselect\aui\bvim\0", "config", "popui.nvim")
time([[Config for popui.nvim]], false)
-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <F3> <cmd>lua require("packer.load")({'vim-maximizer'}, { keys = "<lt>F3>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-p> <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>C-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <M-d> <cmd>lua require("packer.load")({'vim-floaterm'}, { keys = "<lt>M-d>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> / <cmd>lua require("packer.load")({'vim-searchindex'}, { keys = "/", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType xml ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag', 'nvim-lspconfig'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'symbols-outline.nvim', 'nvim-lspconfig', 'formatter.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-lspconfig', 'formatter.nvim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'nvim-lspconfig', 'formatter.nvim', 'nvim-jqx'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'symbols-outline.nvim', 'rust-tools.nvim', 'nvim-lspconfig', 'formatter.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-lspconfig', 'formatter.nvim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'symbols-outline.nvim', 'nvim-lspconfig', 'formatter.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'symbols-outline.nvim', 'nvim-lspconfig', 'formatter.nvim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType solidity ++once lua require("packer.load")({'vim-solidity', 'symbols-outline.nvim', 'nvim-lspconfig', 'formatter.nvim'}, { ft = "solidity" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'symbols-outline.nvim', 'nvim-lspconfig', 'formatter.nvim'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/wplai/.local/share/nvim/site/pack/packer/opt/vim-solidity/ftdetect/solidity.vim]], true)
vim.cmd [[source /Users/wplai/.local/share/nvim/site/pack/packer/opt/vim-solidity/ftdetect/solidity.vim]]
time([[Sourcing ftdetect script at: /Users/wplai/.local/share/nvim/site/pack/packer/opt/vim-solidity/ftdetect/solidity.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
