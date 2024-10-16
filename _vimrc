set runtimepath-=~/vimfiles
set runtimepath^=$USERPROFILE/vimfiles
set runtimepath-=~/vimfiles/after
set runtimepath+=$USERPROFILE/vimfiles/after

let $HOME=$USERPROFILE

set encoding=utf-8
scriptencoding utf-8

" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
" 全角文字に対応
set ambiwidth=double
" Direct X の有効化
set rop=type:directx,renmode:5
" リーダーキー指定
let mapleader = "\<SPACE>"

" プラグイン
call plug#begin('~/vimfiles/plugged')
  Plug 'preservim/nerdtree'
  Plug 'rakr/vim-one'
  Plug 'itchyny/lightline.vim'
  Plug 'morhetz/gruvbox'
  Plug 'shinchu/lightline-gruvbox.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'gabrielelana/vim-markdown'
  Plug 'godlygeek/tabular'
  Plug 'rbtnn/vim-ambiwidth'
  Plug 'tyru/eskk.vim'
call plug#end()

set showcmd
set autoread
set number
set virtualedit=onemore
set laststatus=2
set wrap
set showtabline=2

set textwidth=0 

set directory=~\Documents\BackupFiles\Vim\
set updatetime=30000
set updatecount=500
set noundofile
set nobackup

set smartindent
set tabstop=4
" インデント挿入量
set shiftwidth=4
set noexpandtab
filetype plugin on
filetype indent on
" sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtabの略
autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
autocmd FileType js          setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
autocmd FileType scss        setlocal sw=2 sts=2 ts=2 et
autocmd FileType sass        setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et

" ベル設定
set visualbell t_vb=
set noerrorbells


" 折り返し等も加味した位置へ上下移動
nnoremap j gj
nnoremap k gk
" x についてはレジスタを変更しない
nnoremap x "_x
" C-e でナードツリーを展開
nnoremap <silent><C-e> :NERDTreeToggle<CR>


" 検索に関する設定
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" gVim の場合にメニューなどを表示しない
if has('gui')
  set guifont=Ricty\ Diminished:h12:w6 guifontwide=Ricty\ Diminished:h12
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set guioptions-=b
  set guioptions-=e
endif
if !has('gui_running')
  set t_Co=256
endif


" Insert モードの BS の挙動: オートインデント、改行を削除可能
set backspace=indent,eol,start

" 空白文字類の置き換え  𝘅☓␣⠄▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚
set list listchars=tab:🞂⠄,trail:❦,nbsp:˖,extends:»
hi SpecialKey ctermbg=None ctermfg=7 guifg=#E0E0E0

" set date code to register
let @d = strftime("%Y%m%d")
let @m = "Memo\\" . strftime("%Y%m%d") . "_"

" ------------
" vim-markdown
" ------------
" スペルチェック無効化
let g:markdown_enable_spell_checking = 0

function! s:GetBufByte()
  let byte = line2byte(line('$') + 1)
  if byte == -1
    return 0
  else
    return byte - 1
  endif
endfunction


" ------------
" eskk
" ------------
let g:eskk#directory = "~/.config/skk"
let g:eskk#dictionary = { 'path': "~/.config/skk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/skk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}

let g:eskk#kakutei_when_unique_candidate = 1
let g:eskk#enable_completion = 0
"let g:eskk#no_default_mappings = 1
let g:eskk#keep_state = 0
let g:eskk#egg_like_newline = 1

" eskkのモードについてlightlineに表示する為の関数
function L_eskk_get_mode()
    if (mode() == 'i') && eskk#is_enabled()
        return g:eskk#statusline_mode_strings[eskk#get_mode()]
    else
        return ''
    endif
endfunction

" ------------
" Color Scheme
" ------------
colorscheme one
set background=light
" lightline関係
set noshowmode
let g:lightline = {
    \   'colorscheme': 'one',
    \   'active': {
    \     'left': [ ['mode', 'paste'], ['readonly', 'filename', 'eskk', 'modified'] ]
    \   },
    \   'component_function': {
    \     'eskk': 'L_eskk_get_mode'
    \   },
    \ }

" move to My Document
cd ~\Documents\
