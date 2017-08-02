# Timo Furrer's vim configuration

## Installation

```bash
git clone https://github.com/timofurrer/.vim ~/.vim
cd ~/.vim
git submodule update --init --recursive
# I'm a clang user, thus install ycm with clang support
cd pack/programming/start/YouCompleteMe
python3 install.py --clang-completer
ln -s ~/.vim/vimrc ~/.vimrc
```

**Note**: make sure to install the dependencies of the plugins you want to use.
