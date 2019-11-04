colorscheme badwolf

set nocompatible

filetype plugin on
set path+=**

syntax enable           " enable syntax processing

" toggle hybrid line numbers
" turn absolute line numbers on
set number
set nu
" turn relative line numbers on
set relativenumber
set rnu

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " indent
set expandtab       " tabs are spaces

set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line

filetype indent on      " load filetype-specific indent files

set wildmenu            " visual autocomplete for command menu

set lazyredraw          " redraw only when we need to

set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" open splits below and right
set splitbelow
set splitright

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>


set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" jk is escape
inoremap jk <esc>

" use ; instead of :
:nmap ; :

" highlight last inserted text
nnoremap gV `[v`]

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" open ag.vim
nnoremap <leader>a :Ag

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

call pathogen#infect()                      " use pathogen
" call pathogen#runtime_append_all_bundles()  " use pathogen

augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


set modelines=1
" vim:foldmethod=marker:foldlevel=0

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler_options = ' -std=c++14'
"let g:syntastic_cpp_include_dirs = [ '/opt/ros/kinetic/include', ]
let g:syntastic_cpp_checkers = ['clang_tidy']
"let g:syntastic_cpp_clang_tidy_exec = "clang-tidy"
"let g:syntastic_cpp_clang_tidy_args = "-checks=*,-clang-analyzer-*"

let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#enable_fallback_style = 0
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc,h,hpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,h,hpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc,h,hpp map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" Neomake settings
" When writing a buffer (no delay).
call neomake#configure#automake('w')
