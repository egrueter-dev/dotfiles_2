" Basic Setup:
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" https://www.youtube.com/watch?v=XA2WjJbmmoM Vim without Plugins Tutorial
"
" Nice example vimrc https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" https://medium.com/@todariasova/rails-vim-101-essential-vim-plugins-for-ruby-on-rails-development-d74e808d186d
"
" Map leader key 
" let mapleader = ","

nnoremap \ :vsplit

" Remove the compatibility with VI
set nocompatible

" Add line numbers to file
set number

" Enable detection of file types
filetype on

" Enable filetype specific plugins 
filetype plugin on

" Enable filetype specific indentation
filetype indent on

" Highlight search results
set hlsearch 

"Enable mouse scrolling in normal mode
set mouse=n

" search down into subfolders of the directory with (:find)
set path+=**

" Show matching brackets when text indicator is over them
set showmatch

" Pane switching with Ctrl + h/j/k/l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" set wildmenu (there are other configurations for this)
set wildmenu

" create `tags` file (may need to install ctags first
" brew install ctags - this might not work
command! MakeTags !ctags -R

"Return to last edit position when opening files 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins
"
call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }"
  Plug 'preservim/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'haishanh/night-owl.vim'
call plug#end()

" nnoremap <\> :NERDTree <CR>
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" This does not seem to work: True Color Support
set termguicolors

try
    colorscheme night-owl
catch
endtry

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
