# OSチェック

if [ "$(uname)" = 'Darwin' ]; then
    OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
    OS='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" = 'MINGW32_NT' ]; then
  OS='Cygwin'
elif [ "$(expr substr $(uname -s) 1 9)" = 'CYGWIN_NT' ]; then
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

## 重複パスを登録しない
typeset -U path cdpath fpath manpath

## sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

## pathを設定
path=(~/bin(N-/) /usr/local/bin(N-/) ${path})

# 言語設定
export LANG=ja_JP.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


# プロンプト表示
case ${UID} in
0)
PROMPT="%F{red}%n@%m%%%f "
RPROMPT='[%F{orange}%d%f]'
PROMPT2="%B%{[31m%}%_#%{[m%}%b "
SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
PROMPT="%F{orange}(${HOST%%.*})%f ${PROMPT}"
;;
*)
PROMPT="%F{yellow}%n@%m%%%f "
RPROMPT='[%F{green}%d%f]'
PROMPT2="%{[31m%}%_%%%{[m%} "
SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
PROMPT="%F{green}(${HOST%%.*})%f ${PROMPT}"
;;
esac

# 履歴検索 ctrl+Pで後ろから検索ctrl+Nで後ろから検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 自動補完
autoload -U compinit
compinit
# 大文字小文字の無視
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
# 補完候補を詰めて表示
setopt list_packed
# オートcd
setopt auto_cd
# cd -[tab]でcd履歴表示
setopt auto_pushd
# 重複したディレクトリをpushしない
setopt pushd_ignore_dups
# スペルチェック
setopt correct
# 補完失敗時の音をなくす
setopt nolistbeep
# カラー表示
setopt prompt_subst

#-----------------------------
# コマンドエイリアス
#----------------------------
alias ls='ls -F'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

#------------------
# git alias
#------------------
alias g='git'
alias gc='g commit'
alias gca='g commit --amend'
alias gb='g branch'
alias gcb='g checkout -b'
alias gst='g status'
alias gsh='g show'
alias gco='g checkout'
alias grh='g reset --hard HEAD'
alias gd='g diff'
alias gdc='g diff --cached'
alias gap='g add -p'
alias gsu='g submodule update --init --recursive'
alias gcp='g cherry-pick'
alias gps='g push'
alias gpl='g pull'
alias glog='git log --graph -C -M --pretty=format:"<%h> %ad [%an] %Cgreen%d%Creset %s" --all --date=short'
alias gt='g tag'

# クリップボードコピー
# % cat mail.txt C  # メールの内容をクリップボードにコピーする
if which pbcopy >/dev/null 2>&1 ; then 
    # Mac  
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then 
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then 
    # Cygwin 
    alias -g C='| putclip'
fi

#-----------------------------
# for rake
#-----------------------------
alias rake='noglob rake'

# 魔改造用
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Yosemiteで5.16を使う設定
alias perl="/usr/bin/perl5.16"

# CUDA
if [ $OS = 'Cygwin' ]; then
    export PATH=C:\\cudnn-9.1-windows10-x64-v7.1\\cuda\\bin:$CUDA_PATH:$PATH
else
fi

# GO言語用
if [ $OS = 'Cygwin' ]; then
export GOPATH=C:\\Users\\Takahiro.Kosaka\\go
export PATH=C:\\Go\\bin:$PATH
else
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/takahiro.kosaka/Library/cocos2d-x-3.8/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# cygwin用設定
if [ $OS = 'Cygwin' ]; then
export PATH=C:\\cygwin64\\bin:$PATH
fi

export NVM_DIR="/Users/takahiro.kosaka/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# 面倒くさいのでviは使わせない
alias vi='vim'

# win用のショートカット作成
export CYGWIN="winsymlinks"

# Android
export ANDROID_SDK_ROOT="/Users/takahiro.kosaka/Library/Android/sdk"
export ANDROID_HOME=$ANDROID_SDK_ROOT
export NDK_ROOT=$ANDROID_SDK_ROOT/ndk-bundle
export ANDROID_NDK_ROOT=$NDK_ROOT
export PATH=$ANDROID_HOME:$NDK_ROOT:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# ccache
export PATH=/usr/local/opt/ccache/libexec:$PATH
export USE_CCACHE=1
export NDK_CCACHE=`which ccache`
export CCACHE_CPP2=yes
export CCACHE_COMPILERCHECK=content

# cygwin用のopenコマンド
if [ $OS = 'Cygwin' ]; then
    alias open='cygstart'
else
    alias open='open'
fi

# cygwin用のclipboard参照コマンド
alias clip='cat /dev/clipboard'

# python
#if [ $OS = 'Mac' ]; then
#export PATH=$HOME/anaconda3/bin/:$PATH
#export PATH=$PYENV_ROOT/versions/anaconda3-5.0.0/bin/:$PATH
#else
#fi

#POKEASS
#export PATH=$HOME/git/ScaffoldingScripts/bin/darwin/:$PATH
#export DEPOT_TOOLS=$HOME/git/ScaffoldingScripts/depot_tools
#export PATH=$HOME/.cargo/bin:$PATH
export PATH="$PATH:$HOME/git/depot_tools"
export PATH="$PATH:$HOME/git/PokeAss/GENie"
export PATH="$PATH:$HOME/git/PokeAss/PokeAss/bin/darwin"
export PATH="$PATH:/usr/local/share/dotnet/"
export PATH="$PATH:$HOME/git/PokeAss/PokeAss/dotnet"
#export PATH="/usr/local/Cellar/openssl@1.1/1.1.1d/bin:$PATH"

# AVR-GCC
export PATH=/usr/local/CrossPack-AVR-20131216/bin:$PATH

export MACOSX_DEPLOYMENT_TARGET=10.9

# react, gatsby
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
export PATH=$HOME/.nodebrew/current/bin:$PATH
