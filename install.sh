ln -s ~/dotfiles/_zshrc ~/.zshrc
ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_vim ~/.vim
ln -s ~/dotfiles/_gitconfig ~/.gitconfig
ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/_tmuxinator ~/.tmuxinator

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc

gem install tmuxinator
gem install rubocop
