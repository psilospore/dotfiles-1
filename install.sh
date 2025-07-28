#!/bin/bash

# ln -sfn "$(pwd)/ghc/ghci" "$HOME/.ghci"
# ln -sfn "$(pwd)/ghc/haskeline" "$HOME/.haskeline"

export CONFIG_HOME="$HOME/.config"
mkdir -p $CONFIG_HOME

# Link up git config
ln -sfn "$(pwd)/git/config" "$HOME/.gitconfig"

ln -sfn "$(pwd)/nvim" "$CONFIG_HOME/nvim"
ln -sfn "$(pwd)/doom" "$CONFIG_HOME/doom"

ln -sfn "$(pwd)/ghci" "$HOME/.ghci"
