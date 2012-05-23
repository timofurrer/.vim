# Vim Files
> This is my vim configuration folder, with all my installed plugins

***

## How to use?

First you have to install the `exuberant-ctags`. It's needed in some plugins which we'll install later.
When you have done this you have to clone this repository with the following command:

    git clone git://github.com/timofurrer/.vim.git ~/.vim

If this worked correctly you should have now this repository in your home at: `~/.vim`.
So lets change in this directory:

    cd ~/.vim

To install and update all the plugins you must initialize the `git submodules` to get `vundle`:

    git submodule init
    git submodule update

Now you got `vundle` in `bundle/vundle` directory.
When you have done the previous steps you have to link the vimrc from the cloned repository into your home directory:
**Note:** if you have an old vimrc, delete (`rm -f ~/.vimrc`) or move (`mv ~/.vimrc ~/.vimrc.old`) it first.

    ln -s ~/.vim/vimrc ~/.vimrc

After this you can install the plugins which are prepared for vundle in the `vimrc`:
Thus, open vim and run `:BundleInstall` in command mode.

## Which plugins will be installed?

-> vundle<br />
-> vim-fugitive<br />
-> nerdcommenter<br />
-> nerdtree<br />
-> OmniCppComplete<br />
-> taglist.vim<br />
-> xmledit<br />
-> localvimrc<br />
-> DoxygenToolkit.vim<br />
-> Shebang<br />
-> ctrlp.vim<br />
-> Align<br />
-> a.vim<br />
-> errormarker.vim<br />

## Which features do I have with this vimfiles?

Coming soon...
