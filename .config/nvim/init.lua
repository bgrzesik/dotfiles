vim.cmd([[ source ~/.vimrc ]])

vim.opt.list = true
vim.opt.listchars = "tab:  ,trail:█"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"

	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup({})
			end,
		},

		{ "nvim-tree/nvim-web-devicons" },

		{ "cherrry/soong.vim" },

		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},

		{
			"mrcjkb/rustaceanvim",
			lazy = false,
			config = function()
				local on_attach = function(client, bufnr)
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end

				local rust_analyzer = {
					checkOnSave = {
						command = "clippy",
					},
					imports = {
						granularity = {
							group = "item",
							enforce = true,
						},
						prefix = "crate",
					},
					cargo = {
						buildScripts = {
							enable = true,
						},
					},
					procMacro = {
						enable = true,
					},
				}

				vim.g.rustaceanvim = {
					server = {
						on_attach = on_attach,
						default_settings = {
							["rust-analyzer"] = rust_analyzer,
						},
					},
				}
			end,
		},

		{
			"nvim-tree/nvim-tree.lua",
			config = function()
				vim.g.loaded_netrw = 1
				vim.g.loaded_netrwPlugin = 1

				vim.api.nvim_create_autocmd({ "UIEnter", "TabNewEntered" }, {
					callback = function(args)
						local cwd = vim.fn.getcwd()
						local ops = { path = cwd, focus = false, find_file = true }
						require("nvim-tree.api").tree.open(ops)
					end,
				})

				require("nvim-tree").setup()
			end,
		},

		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("lualine").setup()
			end,
		},

		{
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				local hooks = require("ibl.hooks")

				hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
					vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#555555" })
				end)

				require("ibl").setup({
					indent = { highlight = { "IndentBlanklineChar" } },
					scope = { enabled = false },
				})
			end,
		},

		{
			"nvim-telescope/telescope.nvim",

			dependencies = { "nvim-lua/plenary.nvim" },

			init = function()
				local builtin = require("telescope.builtin")

				vim.keymap.set("n", "<C-K>", builtin.buffers, {})
				vim.keymap.set("n", "<C-p>", builtin.find_files, {})
				vim.keymap.set("n", "<C-/>", builtin.live_grep, {})

				vim.keymap.set("n", "<space>t", builtin.builtin, {})
				vim.keymap.set("n", "<space>o", builtin.lsp_document_symbols, {})
				vim.keymap.set("n", "<space>s", builtin.lsp_dynamic_workspace_symbols, {})
				vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
				vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
				vim.keymap.set("n", "gr", builtin.lsp_references, {})

				require("telescope").load_extension("fzf")
			end,
		},

		{
			"neovim/nvim-lspconfig",
			config = function()
				local lspconfig = require("lspconfig")

				vim.opt.signcolumn = "yes"

				lspconfig.clangd.setup({
					settings = {
						clangd = {
							arguments = {
								"--header-insertion=never",
							},
						},
					},
				})

				vim.api.nvim_create_autocmd("LspAttach", {
					group = group,
					desc = "LSP actions",
					callback = function(event)
						vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#555555" })

						local ops = { buffer = event.buf }
						vim.keymap.set("n", "gh", vim.lsp.buf.hover, ops)
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, ops)
					end,
				})

				vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})

				vim.diagnostic.config({
					virtual_text = true,
					severity_sort = true,
					float = {
						border = "rounded",
						source = "always",
					},
				})

				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

				vim.lsp.handlers["textDocument/signatureHelp"] =
					vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
			end,
		},

		{
			"hrsh7th/nvim-cmp",
			config = function()
				local cmp = require("cmp")

				cmp.setup({
					snippet = {
						expand = function(args)
							vim.snippet.expand(args.body)
						end,
					},

					mapping = cmp.mapping.preset.insert({
						["<C-Space>"] = cmp.mapping.complete(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
					}),

					sources = {
						{ name = "nvim_lsp" },
						{ name = "path" },
						{ name = "buffer" },
					},

					formatting = {
						format = function(_, vim_item)
							-- vim_item.menu = ""
							-- vim_item.kind = ""
							vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
							return vim_item
						end,
					},
				})
			end,
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
	},

	install = {},
})
