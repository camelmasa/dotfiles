# Need to install brew, git, zsh and vim
#
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#
# brew install git
# brew install zsh
# brew install vim
# git clone https://github.com/camelmasa/dotfiles.git

cd ~/dotfiles && brew bundle

ln -s ~/dotfiles/_zshrc ~/.zshrc
ln -s ~/dotfiles/_zsh ~/.zsh
ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_vim ~/.vim
ln -s ~/dotfiles/_gitconfig ~/.gitconfig
ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/_tmuxinator ~/.tmuxinator
ln -s ~/dotfiles/Brewfile ~/Brewfile

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc

cd ~/.vim/bundle/vimproc && make
