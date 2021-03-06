# default editor
export EDITOR=$(which vim)
export VISUAL=$(which vim)

# pager
export PAGER='less'
export LESS='-R'

# homebrew
export HOMEBREW_ROOT=${HOMEBREW_ROOT:='/opt/boxen/homebrew'}

# chruby
if [ -d "${HOMEBREW_ROOT}/share/chruby" ]; then
  RUBIES=(~/.rubies/*)

  source "${HOMEBREW_ROOT}/share/chruby/chruby.sh"
  source "${HOMEBREW_ROOT}/share/chruby/auto.sh"

  [ -f ~/.ruby-version ] && chruby $(cat ~/.ruby-version)
fi

# speed up building ruby
export RUBY_CONFIGURE_OPTS='--disable-install-rdoc --disable-install-ri'

# ruby build cache path
export RUBY_BUILD_CACHE_PATH='~/.rubies/cache'

# Allow bundler to use all the cores for parallel installation
export BUNDLE_JOBS=4

# zsh syntax highlighting
highlighters="${HOMEBREW_ROOT}/share/zsh-syntax-highlighting/highlighters"
[ -d $highlighters ] && export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$highlighters
