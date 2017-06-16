if output=$(which pacman); then
    yes | sudo pacman -S neovim
    yes | sudo pacman -S python2-neovim python-neovim
elif output=$(which apt-get); then
    sudo add-apt-repository ppa:neovim-ppa/unstable -y
    sudo apt-get update -y
    sudo apt-get install neovim -y
    sudo apt-get install python-dev python-pip python3-dev python3-pip -y
elif output=$(which brew); then
    brew install --HEAD neovim
else
    printf 'update the code for os\n'
    exit 0
fi

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/backup
ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

ln -s ~/dotfiles/snippets ~/.config/nvim/UltiSnips

touch ~/.gitignore_global
echo "tags" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

