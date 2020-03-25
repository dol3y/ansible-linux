" This file is managed by Ansible.
" Do NOT modify this file directly.

set nocompatible

execute pathogen#infect()

syntax on
try
  colorscheme solarized
catch
endtry

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif

set showcmd    " Show (partial) command in status line.
set showmatch  " Show matching brackets.
set ignorecase " Do case insensitive matching
set smartcase  " Do smart case matching
set incsearch  " Incremental search
set autowrite  " Automatically save before commands like :next and :make
set hidden     " Hide buffers when they are abandoned

set autoindent
set backspace=indent,eol,start
set expandtab
set nowrap
set shiftwidth=2
set softtabstop=2
set background=dark
set pastetoggle=<f5>
"set clipboard=unnamed

set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

if (exists('+colorcolumn'))
  let &colorcolumn=join(range(81,999),",")
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
  let &colorcolumn="80,".join(range(120,999),",")
endif

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" tmuxline settings
"let g:tmuxline_theme = 'lightline'
"let g:tmuxline_powerline_separators = 0
"let g:tmuxline_preset = {
"  \ 'a': '#S:#P',
"  \ 'win': '#I:#F',
"  \ 'cwin': '#I:#F',
"  \ 'y': "Batt:#(battery)",
"  \ 'z': '%d/%m/%y %R'}

" neocomplete
let g:neocomplete#enable_at_startup = 1

"" use goimports for formatting
"let g:go_fmt_command = "goimports"
"
"" turn highlighting on
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"
"let g:syntastic_go_checkers = ['golint', 'errcheck']
"
"" Open go doc in vertical window, horizontal, or tab
"au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
"au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
"au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
