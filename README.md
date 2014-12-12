# Vim Files
> The perfect vim configuration

***

**Homepage:** [the perfect vim configuration](http://timofurrer.github.com/.vim/)

## How to use?

### Easy way

Just download the file [setup script](https://raw.github.com/timofurrer/.vim/master/setup.sh) and execute it.

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
./install.sh --clang-completer
cd
```

## Which plugins will be installed?

| plugin name | short description |
|:--|:--|:--|
| vundle | bundle manager |
| vim-fugitive | git wrapper |
| vim-markdown | markdown syntax |
| nercommenter | (un)comment lines in current buffer |
| nerdtree | show directory structure and manipulate simple file settings |
| YouCompleteMe | complete C and C++ source code |
| taglist.vim | browser through your source code |
| xmledit | help in writting xml files - auto close tags, jumping etc. |
| localvimrc | source local vimrc file |
| DoxygenToolkit.vim | Provide shortcuts to generate doxygen comment skeletons |
| ctrlp.vim | search for files with regexp and mru |
| Align | align code to specified characters |
| a.vim | switch between source code and header files |
| errormarker.vim | mark compiler errors with signs and highlighted lines |
| TaskList.vim | provide a tag-based tasklist |
| python.vim | indentation for python source code files |
| vim-pandoc | syntax highlighting for pandoc's extended markdown language; converts markdown to PDF |
| cscope.vim | create cscope database and connect to existing proper database automatically |
| vim-flake8 | plugin that runs the currently open file through Flake8, a static syntax and style checker for Python source code. It supersedes both vim-pyflakes and vim-pep8. |
| vim-visual-increment | use CTRL+A/X to create increasing sequence of numbers or letters via visual mode |
| vim-signature | Plugin to toggle, display and navigate marks |

There are some color schemes included as well:

| name |
|:--|
| solarized |

## Key mappings
| shortcut | description |
|:--|:--|
| `F2` | show open buffers with ctrlp |
| `Shift + F2` | clear search highlighting |
| `F3` | toggle the nerd tree `(see plugin nerdtree)` |
| `Shift + F3` | toggle the marks and signs |
| `F4` | toggle the taglist `(see plugin taglist)` |
| `F5` | depends on the filetype: if c or cpp execute make, if python start open file and if shell script start script in the shell you are using |
| `Shift + F5` | show the error at the current cursor position `(see plugin errormarker.vim)` |
| `F6` | change between source and header file in C, C++, etc. `(see plugin a.vim)` |
| `Shift + F6` | make file executable and insert shebang `(see plugin Shebang)` |
| `F7` | insert doxygen comment skeleton `(see plugin DoxygenToolkit.vim)` |
| `Shift + F7` | run flake8 |
| `F8` | generate exuberant-ctags |
| `Shift + F8` | update taglist `(see plugin taglist)` |
| `F9` | check spelling |
| `F10` | jump to next error of make `(see vim command :cn)` |
| `Shift + F10` | align selected lines by the `=` `(see plugin Align)` |
| `F11` | indent entiry source file |
| `Shift + F11` | start ipython in horizontal conque shell |
| `Shift + F12` | start bash in horizontal conque shell |
| `Alt+Left-Arrow` / `Alt+Right-Arrow` | show previous/next buffer `(see vim commands :bp and :bn)` |
| `Ctrl+Space` | show completion buffer |

*Note: maybe some more keys are mapped by the plugins itself*

## Colorschemes

### solarized
[solarized on GitHub](http://github.com/altercation/vim-colors-solarized)

**Screenshot:**<br />
![solarized dark](https://github.com/altercation/solarized/raw/master/img/solarized-vim.png)
