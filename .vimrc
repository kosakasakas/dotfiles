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

 " netrwは常にtree view
let g:netrw_liststyle=3
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1

" クリップボード共有
set clipboard=unnamed
