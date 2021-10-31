" Basic Setup:
" https://www.youtube.com/watch?v=XA2WjJbmmoM Vim without Plugins Tutorial
" Nice example vimrc https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
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

" set wildmenu (there are other configurations for this)
set wildmenu 

" create `tags` file (may need to install ctags first
" brew install ctags - this might not work
command! MakeTags !ctags -R
 
" Autocomplete
" In insert mode:
" Ctrl N to open auto completion option from tags
