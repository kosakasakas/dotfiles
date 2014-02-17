filetype plugin on

" vundleを使うためのおまじない
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 使うプラグインを指定
Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'thinca/vim-quickrun'
Bundle 'The-NERD-tree'
Bundle 'nathanaelkane/vim-indent-guides'

"--------------------------------------------------------------------------
" neocomplcache
"
" 起動設定
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字小文字を無視
let g:neocomplcache_enable_smart_case = 1
" アンダーバー区切りを認識
let g:neocomplcache_enable_underbar_completion = 1

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

"--------------------------------------------------------------------------
" neosnippet

" Plugin key-mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)

 " SuperTab like snippets behavior.
 imap <expr><Shift-TAB> neosnippet#expandable() ?
 "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
 smap <expr><Shift-TAB> neosnippet#expandable() ?
 "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

 " For snippet_complete marker.
 if has('conceal')
   set conceallevel=2 concealcursor=i
   endif

"--------------------------------------------------------------------------
"NERDTree
"
nmap <C-e> :NERDTreeToggle


"--------------------------------------------------------------------------
"vim-indent-guides
"
"
"vim立ち上げ時に自動的にvim-indent-guidesをオンにする。
let g:indent_guides_enable_on_vim_startup = 1
"autoで色付けするのはストップ
let g:indent_guides_auto_colors = 0
""色の変化幅（？）パーセンテージ
let g:indent_guides_color_change_percent = 30
"奇数行の色付け
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=darkblue
""偶数行の色付け
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkblue
"インデントの色付け幅
let g:indent_guides_guide_size = 1

"--------------------------------------------------------------------------
" vim settings

set number
syntax on
set autoindent
set smartindent
"自動インデント
set shiftwidth=4
colorscheme elflord
set ignorecase
set showmatch
set wrap
set tabstop=4"

 " netrwは常にtree view
let g:netrw_liststyle=3
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1

" クリップボード共有
set clipboard=unnamed

" utf-8指定
set fileencodings=utf-8

" 文字コード
"set fileencodings=euc-jp,cp932

" クリップボード設定
set clipboard+=unnamed
set clipboard+=autoselect

"タブの設定
" expandtab   :ソフトタブを有効
" tabstop     :ファイル中のタブをスペース何文字で表示するか
" softtabstop :タブを挿入する際スペース何文字で表示するか
" siftwidth   :自動インデントの際に何も自分表示するか
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" ハードタブ、文末スペースの表示
set list
set lcs=tab:>-,trail:-

" ESCをマッピング
imap <c-j> <esc>

" ノーマルモードのEnterで改行挿入
noremap <CR> o<ESC>

" ~/tmp以下にスワップファイルを生成
set directory-=.

" 横線の表示
set cursorline
highlight CursorLine ctermbg=Black
" highlight CursorLine ctermfg=Blue
"
" 縦線の表示
" set cursorcolumn
"highlight CursorColumn ctermbg=Black
"highlight CursorColumn ctermfg=Blue
