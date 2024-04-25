local boot = require("packer_boot")

on_packer_bootstrap(function(use)

	-- yknow packer can apparently manage itself! :D

	-- nerd tree
	use 'preservim/nerdtree'

  	-- Coc.nvim
  	use {'neoclide/coc.nvim', branch = 'release'}
	
end)

function func_jay_setup_nvim(args)
	
	vim.cmd("CocInstall coc-clangd")
	vim.cmd("CocConfig")

end

vim.api.nvim_create_user_command('JaySetupNeovim', func_jay_setup_nvim, {
	desc = "Setup Neovim with default settings and plugins",
	nargs = '*'
})
