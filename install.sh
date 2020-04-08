#!/bin/bash

ln -s $PWD/.railsrc \
      $PWD/.psqlrc \
      $PWD/.ackrc \
      $PWD/.agignore \
      $PWD/.gitconfig \
      $PWD/.gitignore_global \
      $PWD/.rubocop.yml \
      $PWD/.reek.yml \
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

ln -s $PWD/i3/config ~/.config/i3/config
ln -s $PWD/i3status/config ~/.config/i3status/config
ln -s $PWD/i3status-rs/config.toml ~/.config/i3status-rs/config.toml

ln -s $PWD/kitty/kitty.conf ~/.config/kitty/kitty.conf
cp -rn $PWD/kitty/colors ~/.config/kitty/

ln -s $PWD/nvim/init.vim ~/.config/nvim/init.vim

ln -s $PWD/mutt/muttrc ~/.config/mutt/muttrc
ln -s $PWD/mutt/mailcap ~/.config/mutt/mailcap
