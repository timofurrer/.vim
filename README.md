# Vim Files
> This is my vim configuration folder, with all my installed plugins

***

# How to use?

First you have to clone this repository with the following command:

    $ git clone git://github.com/timofurrer/vimfiles.git ~/.vim

If this worked correctly you should have this repo, but `vundle` has to be initialized as a git submodule:

    $ git submodule init
    $ git submodule update

Now you got `vundle` in `bundle/vundle`.
When you have done the previous steps you have to link the vimrc from the cloned repository into your home directory:

    $ ln -s ~/.vim/vimrc ~/.vimrc

After this you can install the plugins which are prepared for vundle in the `vimrc`:
Thus, open vim and run `:BundleInstall` in command mode.

# Which plugins will be installed?

* vundle
* vim-fugitive
* nerdcommenter
* nerdtree
* OmniCppComplete
* taglist.vim
* xmledit
* localvimrc
* DoxygenToolkit.vim
* Shebang
* ctrlp.vim
* Align
* a.vim
