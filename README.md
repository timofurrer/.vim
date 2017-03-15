# vim configuration
> The perfect vim configuration

***

## How to use?

### Long way

First you have to install the `exuberant-ctags`, `cscope`, `pyflakes`, `flake8` and `pandoc`. They're needed in some plugins which we'll install later.

    sudo apt-get install exuberant-ctags cscope pyflakes pandoc python-pip python-dev
    sudo pip install flake8 jedi

When you have done this you have to clone this repository with the following command:

    git clone https://github.com/timofurrer/.vim.git ~/.vim

If this worked correctly you should have now this repository in your home at: `~/.vim`.
So lets change in this directory:

    cd ~/.vim

To install and update all the plugins you must initialize the `git submodules` to get `vundle`:

    git submodule init
    git submodule update

Now you got `vundle` in `bundle/vundle` directory.
When you have done the previous steps you have to link the vimrc from the cloned repository into your home directory:
**Note:** if you have an old vimrc, delete (`rm -f ~/.vimrc`) or move (`mv ~/.vimrc ~/.vimrc.old`) it first.

    ln -s .vim/vimrc ~/.vimrc

After this you can install the plugins which are prepared for vundle in the `vimrc`:
Thus, open vim and run `:PluginInstall` in command mode.

The YouCompleteMe module needs some installation as well:

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

### Copy & Paste Installation

```bash
mv ~/.vim ~/.vim.old
mv ~/.vimrc ~/.vimrc.old
git clone https://github.com/timofurrer/.vim.git ~/.vim
cd ~/.vim
git submodule init
git submodule update
ln -s .vim/vimrc ~/.vimrc
vi ~/.vimrc # :PluginInstall
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
cd
```

## Colorschemes

### solarized
[solarized on GitHub](http://github.com/altercation/vim-colors-solarized)

**Screenshot:**<br />
![solarized dark](https://github.com/altercation/solarized/raw/master/img/solarized-vim.png)
