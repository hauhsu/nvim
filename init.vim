"Plugins ---------------------- {{{

" Plugs will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
"
Plug 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ji :YcmCompleter GoToDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_blacklist = {}


" snippet engine
Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetsDir='~/.vim/snippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.vim/UltiSnips"]
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<c-j>"

" snippet patterns
Plug 'honza/vim-snippets'

" file browser
Plug 'scrooloose/nerdtree'
nnoremap <silent> <F5> :NERDTreeTabsToggle<CR>
" NERDTress File highlighting

Plug 'jistr/vim-nerdtree-tabs'

" c++/python source overview
Plug 'majutsushi/tagbar'
nnoremap <silent> <F6> :TagbarToggle<CR>

Plug 'tomtom/tlib_vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc_no_folding = 1


"SystemC syntax highlight
"Plug 'Kocha/vim-systemc'

"vim with lldb
Plug 'gilligan/vim-lldb'
let g:lldb_map_Lframe = "<leader>f"

"Git wrapper
Plug 'tpope/vim-fugitive'

"Latex
Plug 'gerw/vim-latex-suite'

"Scala
Plug 'derekwyatt/vim-scala'

"
Plug 'terryma/vim-multiple-cursors'

"Quick comment
Plug 'tpope/vim-commentary'

"Easy Grep
Plug 'dkprice/vim-easygrep'

"Auto pair
Plug 'jiangmiao/auto-pairs'


"
Plug 'easymotion/vim-easymotion'


"
Plug 'sjl/gundo.vim'
nnoremap <F7> :GundoToggle<CR>

Plug 'CodeFalling/fcitx-vim-osx'

Plug '/usr/local/opt/fzf'

" All of your Plugs must be added before the following line
call plug#end()




"----end vim-plug}}}

"Vimscript file settings ---------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


"General configurations
syntax on
colorscheme desert
set nu
set hlsearch
set tabstop=4
set shiftwidth=4
set ai
set backspace=indent,eol,start
set ruler
set mouse=a


"Specific file type setting
au BufRead,BufNewFile *.cpp,*.hpp set cin ai et nu sw=2 ts=2 
au BufRead,BufNewFile *.v set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.c,*.h set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=80 
au BufRead,BufNewFile *.hs set ai et nu sw=4 ts=4 tw=80 
au BufRead,BufNewFile *.sc set ai et nu sw=4 ts=4 tw=80 filetype=scala
au BufRead,BufNewFile *.rst set ai et nu sw=4 ts=4 tw=80 spell
au BufRead,BufNewFile *.tex set ai et nu sw=4 ts=4 tw=80 spell


"Edit and source vimrc
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Compile C/C++ in Vim
autocmd FileType c,cpp  nnoremap <buffer> <leader><space> :w<cr>:make<cr>
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>
nnoremap <leader>cw :cw 10<cr> 

"Toggle Quick Fix window
nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

"Toggle number
nnoremap <leader>n :setlocal number!<cr>

"Toggle paste mode
nnoremap <leader>p :setlocal paste!<cr>


"use \tl to switch to last tab
let g:lasttab = 1
nnoremap <Leader>gt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


inoremap jk <ESC>

"share clip board
set clipboard=unnamed

" Change directory to the current buffer when opening files.
set autochdir

" map esc to exit terminal emulator
:tnoremap <Esc> <C-\><C-n>

set termguicolors

