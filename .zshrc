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

# GO言語用
export GOPATH=$HOME/go
export PATH=$HOME/go/bin:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/takahiro.kosaka/Library/cocos2d-x-3.8/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

export NVM_DIR="/Users/takahiro.kosaka/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# 面倒くさいのでviは使わせない
alias vi='vim'

# win用のショートカット作成
export CYGWIN="winsymlinks"
