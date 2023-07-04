#!/bin/sh
# Detects which OS and if it is Linux then it will detect which Linux
# Distribution.

OS=`uname -s`
REV=`uname -o`


if [ "${OS}" = "Linux" ] ; then
    if [ -f /etc/redhat-release ] ; then
        dnf check-update
        dnf install zsh
        sudo lchsh $USER
    else
        sudo apt update && sudo apt upgrade -y
        sudo apt install -y zsh
        echo "export SHELL=/bin/zsh" > ~/.bash_profile
        echo "exec /bin/zsh -l" >> ~/.bash
        curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
        cp .zshrc ~/.zshrc
        zsh
    fi
fi
