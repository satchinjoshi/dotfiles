if output=$(which pacman); then
    yes | sudo pacman -S neovim \
      git htop vim zsh tmux \
      python2-neovim python-neovim \
      openssl-1.0 the_silver_searcher \
      docker docker-compose postgresql-libs \
      xclip

    sudo systemctl enable docker
    sudo usermod -aG docker $USER
elif output=$(which apt-get); then
    sudo add-apt-repository ppa:neovim-ppa/unstable -y
    sudo apt-get update -y
    sudo apt-get install neovim \
      python-dev python-pip python3-dev \
      python3-pip git zsh  silversearcher-ag \
      curl libpq-dev build-essential \
      libcurl4-openssl-dev libffi-dev \
      -y
elif output=$(which brew); then
    brew install tmux \
        zsh
        --HEAD neovim
        the_silver_searcher
else
    printf 'update the code for os\n'
    exit 0
fi

sudo chsh -s $(which zsh)

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/backup

# Install Oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# link the vim, nvim, zsh, bash and tmux rc file
ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
rm ~/.zshrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# link vim custom snippet
ln -sf ~/dotfiles/snippets ~/.config/nvim/UltiSnips

# Set up git
touch ~/.gitignore_global
echo "tags" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

git config --global user.email "satchin.joshi@gmail.com"
git config --global user.name "Sachin Joshi"

