" Basic Setup:
" https://www.youtube.com/watch?v=XA2WjJbmmoM Vim without Plugins Tutorial
" Nice example vimrc https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" https://medium.com/@todariasova/rails-vim-101-essential-vim-plugins-for-ruby-on-rails-development-d74e808d186d

"Set theme
colorscheme slate

" Remove the compatibility with VI
set nocompatible

" Add line numbers to file
set number

" Enable syntax highlighting
syntax enable

" Enable detection of file types
filetype on

" Enable filetype specific plugins 
filetype plugin on

" Enable filetype specific indentation
filetype indent on

" search down into subfolders of the directory with (:find)
set path+=**

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

" Autocomplete
" In insert mode:
" Ctrl N to open auto completion option from tags

" Install Plug
" Install vim-plug if not found
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
  Plug 'preservim/nerdtree'
call plug#end()

" nnoremap <\> :NERDTree <CR>
map <C-n> :NERDTreeToggle<CR>

