filetype plugin on

" vundleを使うためのおまじない
set rtp+=~/.vim/vundle/
call vundle#rc('~/.vim/bundle')

" 使うプラグインを指定
Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'thinca/vim-quickrun'


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
 imap <expr><TAB> neosnippet#expandable() ?
 "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable() ?
 "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

 " For snippet_complete marker.
 if has('conceal')
   set conceallevel=2 concealcursor=i
   endif

"--------------------------------------------------------------------------
" vim settings

set number
syntax on
set autoindent
set smartindent
" 自動インデント
set shiftwidth=4
colorscheme elflord
set ignorecase
set showmatch
set wrap
set tabstop=4"

"タブの設定
" expandtab   :ソフトタブを有効
" tabstop     :ファイル中のタブをスペース何文字で表示するか
" softtabstop :タブを挿入する際スペース何文字で表示するか
" siftwidth   :自動インデントの際に何も自分表示するか
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

 " netrwは常にtree view
let g:netrw_liststyle=3
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1

" 文字コード
set fileencodings=euc-jp,cp932

" クリップボード共有
set clipboard=unnamed

" ハードタブ、文末スペースの表示
set list
set lcs=tab:>-,trail:-

" ESCをマッピング
imap <c-j> <esc>
" ノーマルモードのEnterで改行挿入
noremap <CR> o<ESC>

" ~/tmp以下にスワップファイルを生成
set directory-=.
