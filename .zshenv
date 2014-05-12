export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl
export PATH=/usr/local/heroku/bin:$PATH
export PATH=~/.gem/ruby/2.0.0/bin:$PATH
export PATH=~/.rvm/bin:$PATH
export PATH=/usr/local/openresty/nginx/sbin:$PATH
export PATH=~/program/ruby/vagrant/bin:$PATH
export PATH=/usr/bin/vendor_perl:$PATH
# pyenv for virtualenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv-3.3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/program/python
source /usr/bin/virtualenvwrapper.sh

# node
export NODE_PATH=/usr/local/lib/node_modules

# editor
export EDITOR=vim

# go
export GOPATH=~/program/go

# karma js
export CHROME_BIN=/usr/bin/chromium
