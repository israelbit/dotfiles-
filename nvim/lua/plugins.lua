local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{"rebelot/kanagawa.nvim"},
	{"saghen/blink.cmp",event={"LspAttach"},version = "1.*",opts = require("options")},
	{"mason-org/mason.nvim",opts = {}},
	{"neovim/nvim-lspconfig",dependencies = {'saghen/blink.cmp'},
	opts = {servers = {clangd = {},marksman = {},superhtml = {} }},
		config = function(_,opts)
			local lspconfig = require('lspconfig')
			for server, config in pairs(opts.servers) do

			config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end

},
})

