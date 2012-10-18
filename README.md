# Vim Files
> The perfect vim configuration

***

**Homepage:** [the perfect vim configuration](http://timofurrer.github.com/.vim/)

## How to use?

First you have to install the `exuberant-ctags`, `cscope` and `pandoc`. They're needed in some plugins which we'll install later.
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

### Copy & Paste Installation

```bash
mv ~/.vim ~/.vim.old
mv ~/.vimrc ~/.vimrc.old
git clone git://github.com/timofurrer/.vim.git ~/.vim
cd ~/.vim
git submodule init
git submodule update
ln -s ~/.vim/vimrc ~/.vimrc
```

## Which plugins will be installed?

For more details see [the next section](https://github.com/timofurrer/.vim#each-plugin-in-detail).

| plugin name | short description |
|:--|:--|:--|
| vundle | bundle manager |
| vim-fugitive | git wrapper |
| vim-markdown | markdown syntax |
| nercommenter | (un)comment lines in current buffer |
| nerdtree | show directory structure and manipulate simple file settings |
| OmniCppComplete | complete C and C++ source code |
| taglist.vim | browser through your source code |
| xmledit | help in writting xml files - auto close tags, jumping etc. |
| localvimrc | source local vimrc file |
| DoxygenToolkit.vim | Provide shortcuts to generate doxygen comment skeletons |
| Shebang | make file executable and insert shebang |
| ctrlp.vim | search for files with regexp and mru |
| Align | align code to specified characters |
| a.vim | switch between source code and header files |
| errormarker.vim | mark compiler errors with signs and highlighted lines |
| TaskList.vim | provide a tag-based tasklist |
| python.vim | indentation for python source code files |
| Conque Shell | Run interactive commands inside a Vim buffer |
| eregex.vim | provide search and replace functions to use perl regex instead of the vim's |
| vim-pandoc | syntax highlighting for pandoc's extended markdown language; converts markdown to PDF |
| sudoku.vim | plugin to solve sudoku files |
| cscope.vim | create cscope database and connect to existing proper database automatically |
| SearchComplete | Tab completion of words inside of a search ('/') |

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
| `F4` | toggle the taglist `(see plugin taglist)` |
| `F5` | depends on the filetype: if c or cpp execute make, if python start open file and if shell script start script in the shell you are using |
| `Shift + F5` | show the error at the current cursor position `(see plugin errormarker.vim)` |
| `F6` | change between source and header file in C, C++, etc. `(see plugin a.vim)` |
| `Shift + F6` | make file executable and insert shebang `(see plugin Shebang)` |
| `F7` | insert doxygen comment skeleton `(see plugin DoxygenToolkit.vim)` |
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

## Each plugin in detail

### vundle
[vundle on GitHub](https://github.com/gmarik/vundle)
`vundle` is a plugin manager. You can easily configure a set of bundles in your `vimrc` you want to use in your daily life.
Note: The plugins must be available in a git repository.
Specify your plugins like this in your `vimrc`:

```VimL
" plugin from the vim-scripts GitHub account
Bundle 'xmledit'
Bundle 'a.vim'

" plugin from another GitHub account
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'

" plugin from another git server
Bundle 'git://git.wincent.com/command-t.git'
```

After you have specified the plugins you want, open an empty vim instance and call ...

```VimL
:BundleInstall
```

... to install the plugins in your vimrc. The plugins will be loaded automatically during each startup.
You are be able to update all the plugins as well with the following command:

```VimL
:BundleInstall!
```

Some more useful commands which are provided:

```VimL
" List all configured bundles
:BundleList

" search (or refresh cache first) for a plugin (for example for plugin 'foo')
:BundleSearch(!) foo

" confirm (or auto-approve) removal of unused bundles
:BundleClean(!)
```

### vim-fugitive
[vim-fugitive on GitHub](https://github.com/tpope/vim-fugitive)
The author of `vim-fugitive` descripes his plugin like this:

*I'm not going to lie to you; fugitive.vim may very well be the best Git wrapper of all time.*

... I think it's true ;)

With this plugin you can do all things with git directly in vim. Thus, you can watch `git diff` with `:Gdiff` or see the output of `git status` with `:Gstatus`.
Check out all the feature on the `GitHub page` of `vim-fugitive`

### vim-markdown
[vim-markdown on GitHub](https://github.com/tpope/vim-markdown)
This is not a real plugin - It's just a better syntax highlighting for markdown files as vim provieds by default.

### nerdcommenter
[nerdcommenter on GitHub](https://github.com/scrooloose/nerdcommenter)
`nerdcommenter` is a very helpful plugin in daily life. You can easily comment and uncomment lines in your buffer. There are functions
to `comment out the current line or text selected in visual mode` or `comment the current line from the cursor to the end of line`.
Check out the full manual on the link above.

### nerdtree
[nerdtree on GitHub](https://github.com/scrooloose/nerdtree)
The NERDtree allows you to explore your filesystem and to open files and directories.
It presents the filesystem to you in the form of a tree which you manipulate with the keyboard and/or mouse. It also allows you to perform simple filesystem operations.
To show the `nerdtree` you can simply press `F3` if you are using the `vimrc` from this repository.

### OmniCppComplete
[OmniCppComplete on GitHub](https://github.com/vim-scripts/OmniCppComplete)
This plugin provides you code completion for C and C++. With `F8` (mapped in my `vimrc`) you can generate tags from your current source (exuberant-ctags are used)-
It's not finished yet but now you can:
- Complete namespaces, classes, structs and union members.
- Complete inherited members for classes and structs (single and multiple inheritance).
- Complete attribute members.
- Complete type returned by a function.
- Complete the "this" pointer.
- Complete a typedef.
- Complete the current scope (global and class scope).
- Complete an object after a cast (C and C++ cast).
- Complete anonymous types (eg: struct {int a; int b;}g_Var; g_Var.???). It also works for a typedef of an anonymous type.

### taglist.vim
[taglist.vim on GitHub](https://github.com/vim-scripts/taglist.vim)
With this smart plugin can you browser your source code. It shows you every `class`, `method`, `function` and a lot more structures of your code.
You can move with your arrow-keys and jump to a structure with simply press Enter.
In my `vimrc` you can open the browser with `F4` - it will appear in a seperate buffer in the right of the current.

### xmledit
[xmledit on GitHub](https://github.com/sukima/xmledit/)
`xmledit` is a file type plugin to help edit XML documents. It includes tag completion and tag jumping.
Another useful feature of this plugin is the automatically closing  mechanism of the current tag when you close this tag with `>`.

### localvimrc
[localvimrc on GitHub](https://github.com/vim-scripts/localvimrc)
Sometimes, when you work on different projects, you have the problem, that you have to follow different code guidelines, for example for indentation.
So you can simply create another `vimrc` file as your normally used `~/.vimrc`. This `vimrc` file is called `.lvimrc`. This vim-script file will be sourced in every start of vim.
If you are using git while you have to create a `local vimrc` you can put `.lvimrc` in your `.gitignore` file to ignore this file.

### DoxygenToolkit.vim
[DoxygenToolkit.vim on GitHub](https://github.com/vim-scripts/DoxygenToolkit.vim)
The `DoxygenToolkit.vim` plugin provides some shortcut commands to generate skeletons of `doxygen` comments.
The supported languages are `C, C++ and Python`. For functions these tags are generated: `@brief`, `@param (for each argument)` and `@return`.
To generate the `doxygen skeleton` go to the method or function you want to descripe with the cursor and execute `:Dox`.

### Shebang
[Shebang on GitHub](https://github.com/vim-scripts/Shebang)
This plugin tries to reduce the repetitive work it is to make a file executable. It makes the current opened file executable and inserts the `Shebang` if it is not set yet.
This functionality is mapped to `F6` with my `vimrc`.

### ctrlp.vim
[ctrlp.vim on GitHub](https://github.com/kien/ctrlp.vim)
This plugin is a full path fuzzy file, buffer, mru and tag finder. It supports `vim's regexp as search pattern`, `Most recently used (MRU) files monitoring`, `project's root finder`, `open multiple files at once`, `create new files and directories`. As the name says: it is mapped to `ctrlp`.
For the whole usage manual check out the repository link to GitHub.

### Align
[Align on GitHub](https://github.com/vim-scripts/Align)
Align and AlignMaps lets you align statements on their equal signs, make comment boxes, align comments, align declarations, etc.
There are often situation in your daily life in which you want to align, for example, some variable declarations with the `=`.
For this problem the shortcut `Shift + F10` is mapped to solve it. Thus, you can select these declarations in visual mode and press the shortcut - and this plugin will align your code.

### a.vim
[a.vim on GitHub](https://github.com/vim-scripts/a.vim)
`a.vim` provides some commands to switch between the source code and header files of C and C++ projects. The `F2` key is mapped to make this work.
There are also some more variants to switch between these two files, like `:AS - to splits and switches`, `:AV - to split vertical and switches`, `:AT` - creates a new tab and switches. There are many more - check out the link above for more details.

### errormarker.vim
[errormarker.vim on GitHub](https://github.com/vim-scripts/errormarker.vim)
Hooks the make quickfix command and converts all compiler errors into signs that are placed next to the line with the error. Additionally, lines with errors are highlighted.
The `make` command is mapped to `F5` and to jump to the next error simply press `Shift + F5` or `F10`.

### TaskList.vim
[TaskList.vim on GitHub](https://github.com/vim-scripts/TaskList.vim)
TaskList.vim is a very useful plugin. It searches for strings like "FIXME" and "TODO" and shows the found lines in a seperate buffer.
You can move over this list and jump to the correspondent line in the source file.

### python.vim
[python.vim on GitHub](https://github.com/gg/python.vim)
This plugin provieds better code indentation for python source files.

### Conque Shell
[Conque Shell on Github](https://github.com/alejandrogomez/Conque-Shell)
With this plugin you can run interactive programs in a vim buffer - for instance a shell or ipython..

### eregex.vim
[eregex.vim on GitHub](https://github.com/othree/eregex.vim)
This plugin provides some search and replace functions which uses the perl and not the internal vim-script regex-syntax.
For example you can do a search and replace with `:%S//` and using the perl syntax instead of the vim-script-sytax variant with `:%s//'..

### vim-pandoc
[vim-pandoc on GitHub](https://github.com/vim-pandoc/vim-pandoc)
With these plugin you have syntax highlighting for the pandoc extended markdown language.
But the reason why I have included this to my vim repository is, that it can convert markdown to PDF files which can be very useful if you want a local documentation of your project which was originally written in markdown.

### sudoku.vim
[sudoku.vim on GitHub](https://github.com/timofurrer/sudoku.vim)
These plugin maps Shift + F6 for sudoku files (files with extenstion `.sdk` or `.sudoku`) to solve them.

## Colorschemes

### solarized
[solarized on GitHub](http://github.com/altercation/vim-colors-solarized)

**Screenshot:**<br />
![solarized dark](https://github.com/altercation/solarized/raw/master/img/solarized-vim.png)
