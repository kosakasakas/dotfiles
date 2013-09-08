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
RPROMPT='[%F{green}%d%f]'
PROMPT2="%B%{[31m%}%_#%{[m%}%b "
SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
;;
*)
PROMPT="%F{yellow}%n@%m%%%f "
RPROMPT='[%F{green}%d%f]'
PROMPT2="%{[31m%}%_%%%{[m%} "
SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
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
alias gst='g status'
alias glog='git log --graph -C -M --pretty=format:"<%h> %ad [%an] %Cgreen%d%Creset %s" --all --date=short'
