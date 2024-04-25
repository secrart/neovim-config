local boot = require("packer_boot")

on_packer_bootstrap(function(use)

	-- yknow packer can apparently manage itself! :D

	-- nerd tree
	use 'preservim/nerdtree'

  	-- Coc.nvim
  	use {'neoclide/coc.nvim', branch = 'release'}

	--lualine
	use 'nvim-lualine/lualine.nvim'
	
	-- green gruvbox theme
	use 'morhetz/gruvbox'

 	use {
        	'ryanoasis/vim-devicons',
        	config = function()
            	-- Additional configuration goes here
            	vim.g.webdevicons_conceal_nerdtree_brackets = 1
            	vim.g.DevIconsEnableFoldersOpenClose = 1
            	vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
        	end
    	}

end)

function func_jay_setup_nvim(args)
	
	vim.cmd("CocInstall coc-clangd")
	vim.cmd("CocConfig")
	vim.cmd("PackerInstall")
end

vim.api.nvim_create_user_command('JaySetupNeovim', func_jay_setup_nvim, {
	desc = "Setup Neovim with default settings and plugins",
	nargs = '*'
})

require('lualine').setup {
  options = {
    icons_enabled = true,  -- Set to false if you don't want icons
    theme = 'auto',        -- Automatically sets the theme based on your Neovim theme
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},  -- Current mode
    lualine_b = {'branch', 'diff', {'diagnostics', sources={'nvim_diagnostic'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


vim.opt.number = true
vim.cmd('colorscheme gruvbox')
vim.g.gruvbox_contrast_dark = 'hard'  -- for a little more contrast
vim.cmd('autocmd VimEnter * NERDTree')
