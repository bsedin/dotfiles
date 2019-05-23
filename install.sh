#!/bin/bash

ln -s $PWD/.railsrc \
      $PWD/.psqlrc \
      $PWD/.ackrc \
      $PWD/.agignore \
      $PWD/.gitconfig \
      $PWD/.gitignore_global \
      $PWD/.rubocop.yml \
      $PWD/.screenrc \
      $PWD/.xinitrc \
      $PWD/.Xresources \
      $PWD/.zshenv \
      $PWD/.zshrc \
      $PWD/.zshrc.d \
      $PWD/.ansible.cfg \
      $PWD/.ruby-lint.yml \
      ~/

ln -s  $PWD/htop ~/.config/
ln -s $PWD/qutebrowser/config.py ~/.config/qutebrowser/config.py

cp -n $PWD/.bundle-config ~/.bundle/config
