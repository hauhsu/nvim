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


" Syntaxt check
Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <leader>sy :SyntasticToggleMode<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


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
nnoremap <leader>t :NERDTreeToggle<CR>
  " open nerdtree in current file dir
map <Leader>nt :NERDTree %:p:h<CR>
  " NERDTress File highlighting
let NERDTreeIgnore=['\.o$', '__pycache__' ]


" c++/python source overview
Plug 'majutsushi/tagbar'
nnoremap <leader>y :TagbarToggle<CR>

Plug 'tomtom/tlib_vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc_no_folding = 1


"SystemC syntax highlight
"Plug 'Kocha/vim-systemc'

"vim with lldb
"Plug 'gilligan/vim-lldb'
"let g:lldb_map_Lframe = "<leader>f"

"Git wrapper
Plug 'tpope/vim-fugitive'
set diffopt+=vertical
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit -s<cr>
nnoremap <leader>gb :Gblame<cr>



"fugitive extension
Plug 'junegunn/gv.vim'

"Latex
Plug 'gerw/vim-latex-suite'

"Scala
"Plug 'derekwyatt/vim-scala'

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

" Jenkinsfile
"Plug 'martinda/Jenkinsfile-vim-syntax'

" Arm asm
Plug 'ARM9/arm-syntax-vim'

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
set autoindent
set backspace=indent,eol,start
set ruler
set noexpandtab
"set mouse=a
"
set statusline+=%F

syntax enable
set termguicolors
set cursorline


"Specific file type setting
au BufRead,BufNewFile *.cpp,*.hpp set cin ai nu sw=2 ts=2 
au BufRead,BufNewFile *.sh set cin ai nu sw=4 ts=4 expandtab syn=sh
au BufRead,BufNewFile *.v set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.c,*.h set cin ai nu sw=8 ts=8 noexpandtab
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=80 colorcolumn=80
au BufRead,BufNewFile *.pl set ai et nu sw=2 ts=2 tw=80 expandtab
au BufRead,BufNewFile *.hs set ai et nu sw=4 ts=4 tw=80
au BufRead,BufNewFile *.sc set ai et nu sw=4 ts=4 tw=80 filetype=scala
au BufRead,BufNewFile *.rst set ai et nu sw=4 ts=4 tw=80 spell
au BufRead,BufNewFile *.tex set ai et nu sw=4 ts=4 tw=80 spell
au BufRead,BufNewFile *.exp set filetype=tcl sw=8 ts=8 noexpandtab
au BufRead,BufNewFile Jenkinsfile.* set filetype=Jenkinsfile sw=2 ts=2 noexpandtab
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7


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

"Toggle list
nnoremap <leader>l :setlocal list!<cr>

"Orgnize code
nnoremap <leader>o <ESC>gg=G<C-o><C-o>

" turn off highlight
nnoremap <leader>h :noh<return><esc>

inoremap jk <ESC>

" share clip board
set clipboard=unnamed

" change directory to the current buffer when opening files.
set autochdir

" map esc to exit terminal emulator
:tnoremap <Esc> <C-\><C-n>




" highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" show word count
nnoremap <leader>wc *<C-O>:%s///gn<CR><C-O>

" diff shortcuts
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>df :windo diffthis<CR>


" show function name in status bar
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
nnoremap <leader>f :call ShowFuncName() <CR>

