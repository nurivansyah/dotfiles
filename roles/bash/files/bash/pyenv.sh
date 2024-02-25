#!/usr/bin/env bash

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && addToPathFront $PYENV_ROOT/bin export
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"