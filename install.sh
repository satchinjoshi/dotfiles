sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update -y
sudo apt-get install neovim -y

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/backup
ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
