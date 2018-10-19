#!/usr/bin/python
import os
os.system("cp ./.vimrc ~/; cp -r ./.vim ~/")
os.system("mkdir ~/.fonts")
os.system("mkdir ~/.config/fontconfig/conf.d -p")
os.system("git clone https://github.com/ryanoasis/powerline-extra-symbols")
os.system("mv powerline-extra-symbols ~/.fonts")
os.system("fc-cache -vf ~/.fonts/")
os.system("mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/")
os.system("sudo apt-get update &&  apt-get install curl build-essential cmake ctags python-dev -y")
os.system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
os.system("vim +PluginInstall +qall")
os.system("vim +PlugInstall +qall")
os.system("~/.vim/plugged/youcompleteme/install.py")
