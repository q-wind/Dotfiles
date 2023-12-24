" 关闭与vi的兼容性，以开启更多功能
" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality.
set nocompatible

" Turn on syntax highlighting.
" ----------------------------------------
syntax on

" Enable filetype detection
" ----------------------------------------
filetype on
filetype plugin on
filetype indent on

" Tab and Space
" ----------------------------------------
set tabstop=4       " tab宽度
set expandtab       " 使用空格缩进 
set softtabstop=4   " 编辑时回退tab也为4个
set autoindent      " 自动缩进
set shiftwidth=4    " 自动缩进时的长度
" in Makefile we need normal tab 
autocmd FileType make setlocal noexpandtab

" Cursor style
" ----------------------------------------

" Highlight active window's current line
" ----------------------------------------
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" Color Scheme
" ----------------------------------------
set background=dark
highlight StatusLine cterm=bold ctermfg=235 ctermbg=245     " currentwindow status line 
highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235   " other window
highlight SignColumn ctermbg=234

" Basic Setting
" ----------------------------------------
set shortmess+=I    " disable the default Vim startup message.
set number          " show line numbers.
set relativenumber  " enble relative line number
set showcmd         " show command in bottom bar
set laststatus=2    " show statusline at bottom
set statusline=\ %<%F[%n%M%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ [%l,%c]\ %p%%\ %)
set mouse+=a        " enable mouse support
set splitbelow
set splitright      " let split more nature
set showmatch       " match the ()[]{}
set textwidth=100
set linebreak
set backspace=indent,eol,start  " make backspace behave in more intuitive way
set hidden      " allow buffer not displayed in any window

" Search
" ----------------------------------------
set ignorecase  " 用小写时匹配所有，主动用大写搜索时敏感
set smartcase
set incsearch   " searching as you type

" Unbind some useless/annoying default key bindings.
nmap Q <Nop>    " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Try to prevent bad habits of using arrow for moving in normal mode 
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" CtrlP plugin
set runtimepath^=~/.vim/pack/vendor/start/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'  " 默认路径为当前路径

