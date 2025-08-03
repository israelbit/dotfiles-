vim.opt.number = true
vim.lsp.enable({'harper_ls','clangd','marksman','superhtml'})


return {
	cmp = { 
		keymap = require("keymaps").cmp,
		appearance = {
			nerd_font_variant = 'mono'
		},
		completion = {documemntation = {auto_show = true}},
	}
}

