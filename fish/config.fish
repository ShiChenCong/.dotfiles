alias vi "nvim"
alias v "nvim"

alias t "tmux"
alias ta "tmux attach"
alias l 'lazygit'
alias cl 'clear'
alias j 'z'
alias p 'pnpm'
alias ll " exa --icons -l --no-user "
alias ls " exa --icons -l --no-user "
alias ssr "http_proxy=http://127.0.0.1:1087 https_proxy=http://127.0.0.1:1087"
alias ff "fzf | xargs nvim"

alias ps "python3 -m http.server"
# alias nv '/Applications/neovide.app/Contents/MacOS/neovide'
alias nv 'neovide --frame=none'

alias gs 'git log --pretty=format:"%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s" --graph'
alias ssr "http_proxy=http://127.0.0.1:7890 https_proxy=http://127.0.0.1:7890"
alias set_proxy "export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"
alias unset_proxy 'set -e https_proxy; set -e http_proxy; set -e all_proxy'

# set -e TERMINFO


set -gx PATH /opt/homebrew/bin $PATH
# set -gx PATH ~/.local/bin $PATH
# set -gx PATH ~/.bun/bin $PATH
# set -gx PATH /opt/homebrew/Cellar/node@14/14.17.6/bin:$PATH
set -gx PATH /usr/local/bin:$PATH
set -gx PATH "$HOME/.cargo/bin" $PATH
set -g PATH /Users/scc/.local/share/bob/nvim-bin $PATH
# set -g PATH /Users/shichencong/.local/share/bob/nvim-bin $PATH
#
# # deno
# set -x PATH $HOME/.deno/bin:$PATH
#
# set -U fish_greeting ""
#
# set -gx TERM wezterm
#

# 测试
set -x PATH /Users/scc/rust-project/t-filter/target/release $PATH
alias ff 't-filter'

set -x PATH /Users/scc/rust-project/fish-demo/target/release $PATH

# function nvm
#   bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
# end

# # ~/.config/fish/functions/nvm_find_nvmrc.fish
# function nvm_find_nvmrc
#   bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
# end

# # ~/.config/fish/functions/load_nvm.fish
# function load_nvm --on-variable="PWD"
#   set -l default_node_version (nvm version default)
#   set -l node_version (nvm version)
#   set -l nvmrc_path (nvm_find_nvmrc)
#   if test -n "$nvmrc_path"
#     set -l nvmrc_node_version (nvm version (cat $nvmrc_path))
#     if test "$nvmrc_node_version" = "N/A"
#       nvm install (cat $nvmrc_path)
#     else if test "$nvmrc_node_version" != "$node_version"
#       nvm use $nvmrc_node_version
#     end
#   else if test "$node_version" != "$default_node_version"
#     echo "Reverting to default Node version"
#     nvm use default
#   end
# end

export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
export PATH="/Users/scc/flutter/flutter/bin:$PATH"
