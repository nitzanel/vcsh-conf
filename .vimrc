call plug#begin()

Plug 'a-watson/vim-gdscript'
Plug 'majutsushi/tagbar'
Plug 'freitass/todo.txt-vim'
Plug 'tpope/vim-surround'
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

set tags+=tags,/home/nitzanel/godot-ide-helper/tags
let g:tagbar_type_gdscript = {
			\'ctagstype' :'gdscript',
			\'kinds':[
			\'c:constants',
			\'e:exports',
			\'o:onready',
			\'p:preloads',
			\'s:signals',
			\'f:functions',
			\]
			\}


filetype plugin indent on
let g:molokai_original = 1
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
"let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:airline_theme = 'powerlineish'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'




filetype on
" vimrc file for following the coding standards specified in PEP 7 & 8.
"
" To use this file, source it in your own personal .vimrc file (``source
" <filename>``) or, if you don't have a .vimrc file, you can just symlink to it
" (``ln -s <this file> ~/.vimrc``).  All options are protected by autocmds
" (read below for an explanation of the command) so blind sourcing of this file
" is safe and will not affect your settings for non-Python or non-C files.
"
"
" All setting are protected by 'au' ('autocmd') statements.  Only files ending
" in .py or .pyw will trigger the Python settings while files ending in *.c or
" *.h will trigger the C settings.  This makes the file "safe" in terms of only
" adjusting settings for Python and C files.
"
" Only basic settings needed to enforce the style guidelines are set.
" Some suggested options are listed but commented out at the end of this file.

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
set tabstop=4
set shiftwidth=4
set expandtab
" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.  " Python: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile  *.cs *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile  *.cs *.py,*.pyw set expandtab
"fu Select_c_style()
"    if search('^\t', 'n', 150)
"        set shiftwidth=4
"        set noexpandtab
"    el 
"        set shiftwidth=4
"        set expandtab
"    en
"endf


au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
" Python: 79 
" C: 79
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=150

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix


" ----------------------------------------------------------------------------
" The following section contains suggested settings.  While in no way required
" to meet coding standards, they are helpful.

" Set the default file encoding to UTF-8: ``set encoding=utf-8``

" Puts a marker at the beginning of the file to differentiate between UTF and
" UCS encoding (WARNING: can trick shells into thinking a text file is actually
" a binary file when executing the text file): ``set bomb``

" For full syntax highlighting:
let python_highlight_all=1
syntax on

filetype indent on
set softtabstop=4
set autoindent
set number
set hlsearch
set ruler
set title
set wildmenu
set wildignore=*.o,*.obj,*.py[co],*.swp,*~,~.pyc
set laststatus=2
set matchpairs+=<:>
set ignorecase
set smartcase
set relativenumber
set number
set bs=indent,eol,start
autocmd BufNewFile  *.py	0r ~/.vim/python_template.py
set scrolloff=5

" commands on startup
"au VimEnter * vsplit 
"au VimEnter * term
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

