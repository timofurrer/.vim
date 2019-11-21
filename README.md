# Timo Furrer's vim configuration

## Prerequisites
```
sudo apt install cmake python3-dev exuberant-ctags
```

## Installation

```bash
git clone https://github.com/timofurrer/.vim ~/.vim
cd ~/.vim
git submodule update --init --recursive
test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.bak
ln -s ~/.vim/vimrc ~/.vimrc

# install ycm with clang support
cd pack/programming/start/YouCompleteMe

# if you like C++ completion
python3 install.py --clang-completer

# if you like Rust completion
python3 install.py --rust-completer
```

**Note**: make sure to install the dependencies of the plugins you want to use.
