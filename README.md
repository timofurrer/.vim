# Timo Furrer's vim configuration

## Installation

```bash
git clone https://github.com/timofurrer/.vim ~/.vim
cd ~/.vim
git submodule update --init --recursive
# I'm a clang user, thus install ycm with clang support
cd pack/programming/start/YouCompleteMe
# if want C++ completion with clang
python3 install.py --clang-completer
# if you want Rust completion
python3 install.py --rust-completer
ln -s ~/.vim/vimrc ~/.vimrc
```

**Note**: make sure to install the dependencies of the plugins you want to use.
