#!/usr/bin/env zsh

#  verify if homebrew is installed
if ! command -v brew &> /dev/null; then
  echo "brew is not installed. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  exit 1
fi

# verify if asdf is installed
if ! command -v asdf &> /dev/null; then
  echo "asdf is not installed. Installing..."
  brew install asdf
  exit 1
fi

# install last version of nodejs if not installed
FOUND_NODEJS=$(whereis -b node | grep .asdf)
if [ -z "$FOUND_NODEJS" ]; then
  echo "nodejs is not installed. Installing..."
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  echo "legacy_version_file = yes" > $HOME/.asdfrc
  asdf install nodejs latest
  asdf global nodejs latest
fi

# install last version of python if not installed
FOUND_PYTHON=$(whereis -b python | grep .asdf)
if [ -z "$FOUND_PYTHON" ]; then
  echo "python is not installed. Installing..."
  asdf plugin add python
  # export ASDF_PYTHON_PATCH_URL="https://github.com/python/cpython/commit/8ea6353.patch?full_index=1"
  echo "ansible" > $HOME/.default-python-packages
  echo "pipenv" >> $HOME/.default-python-packages
  asdf install python latest
  asdf global python latest
fi

# install last version of ruby if not installed
FOUND_RUBY=$(whereis -b ruby | grep .asdf)
if [ -z "$FOUND_RUBY" ]; then
  echo "ruby is not installed. Installing..."
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
  echo "bundler" > $HOME/.default-gems
  echo "pry" >> $HOME/.default-gems
  echo "gem-ctags" >> $HOME/.default-gems
  asdf install ruby latest
  asdf global ruby latest
fi

# install last version of erlang if not installed
FOUND_ERLANG=$(whereis -b erl | grep .asdf)
if [ -z "$FOUND_ERLANG" ]; then
  echo "erlang is not installed. Installing..."
  sudo pacman -S --needed base-devel
  sudo pacman -S ncurses
  asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
  asdf install erlang latest
  asdf global erlang latest
fi

# install last version of elixir if not installed
FOUND_ELIXIR=$(whereis -b elixir | grep .asdf)
if [ -z "$FOUND_ELIXIR" ]; then
  echo "elixir is not installed. Installing..."
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
  asdf install elixir latest
  asdf global elixir latest
fi


# install last version of bun if not installed
FOUND_BUN=$(whereis -b bun | grep .asdf)
if [ -z "$FOUND_BUN" ]; then
  echo "bun is not installed. Installing..."
  asdf plugin-add bun
  asdf install bun latest
  asdf global bun latest
fi

# install last version of yarn if not installed
FOUND_YARN=$(whereis -b yarn | grep .asdf)
if [ -z "$FOUND_YARN" ]; then
  echo "yarn is not installed. Installing..."
  asdf plugin-add yarn
  asdf install yarn latest
  asdf global yarn latest
fi

# install last version of pnpm if not installed
FOUND_PNPM=$(whereis -b pnpm | grep .asdf)
if [ -z "$FOUND_PNPM" ]; then
  echo "pnpm is not installed. Installing..."
  asdf plugin-add pnpm
  asdf install pnpm latest
  asdf global pnpm latest
fi

