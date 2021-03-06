alias vi "nvim"
alias v "nvim"

alias t "tmux"
alias ta "tmux attach"
alias lg 'lazygit'
alias cl 'clear'
alias j 'z'
alias ll " exa --icons -l --no-user "
alias ls " exa --icons -l --no-user "
alias ssr "http_proxy=http://127.0.0.1:1087 https_proxy=http://127.0.0.1:1087"

alias gs 'git log --pretty=format:"%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s" --graph'
alias ssr "http_proxy=http://127.0.0.1:7890 https_proxy=http://127.0.0.1:7890"


set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/Cellar/node@14/14.17.6/bin:$PATH
# set -gx PATH /usr/local/bin/node:$PATH
set -gx PATH "$HOME/.cargo/bin" $PATH

set -U fish_greeting ""
