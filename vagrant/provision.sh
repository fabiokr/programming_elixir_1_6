#!/bin/bash

function apt_ppa_repository_with_key {
  wget --quiet -O - "$2" | apt-key add -
  sh -c "echo '$3' >> $1"
}

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

UBUNTU_CODENAME=$(lsb_release --codename | cut -f2)

echo "Configuring locale"
echo 'LC_ALL="en_US.utf8"' >> /etc/environment

echo "Forward ssh"
echo "Defaults env_keep+=SSH_AUTH_SOCK" >> /etc/sudoers

echo "Setting up repositories..."

# Erlang
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb

echo "Updating repositories..."
apt-get update

echo "Installing packages..."

packages=(
  # build essential
  build-essential
  # automatic configure script builder
  autoconf
  # compilation
  make
  # makefiles
  automake
  # unzip
  unzip

  # Elixir
  esl-erlang
  elixir

  # better shell
  zsh

  # terminal multiplexer
  tmux

  # nfs client
  nfs-common
)

apt -y -qq install ${packages[@]}

echo "Setting zsh as the default shell"
chsh -s /bin/zsh vagrant
