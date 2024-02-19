#!/usr/bin/env zsh

addToPath $HOME/.dotfiles/bin
addToPath /usr/local/go/bin
# addToPath $GOPATH/bin
# addToPath $HOME/go/bin
addToPath /usr/local/nodejs/bin
addToPathFront $HOME/.local/bin

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/nodejs/bin