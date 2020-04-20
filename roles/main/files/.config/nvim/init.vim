" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'airblade/vim-gitgutter'
Plug 'alaviss/nim.nvim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
call plug#end()

" Config
if (has('termguicolors'))
  set termguicolors
endif

syntax enable
colorscheme tempus_dusk

set background=dark
set number relativenumber
set nowrap
set splitbelow
set splitright
set showmatch
set pastetoggle=<F5>
set clipboard+=unnamed

noremap <leader>s :vsplit .<CR>
noremap <leader>h :split .<CR>
noremap <leader>o :E<CR>

