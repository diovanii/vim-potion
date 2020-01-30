# vim-potion

* **[Installation](#installation)**
* **[Usage](#usage)**
* **[License](#license)**

<br>

This plugin adds syntax highlighting to [Potion](http://perl11.org/potion/) files and some key mappings to work with it 

<br>

## :wrench: Instalation

###### Using _[vim-plug](https://github.com/junegunn/vim-plug)_:

add these lines to you `.vimrc`

```vim
call plug#begin()
Plug 'diovanii/vim-potion'
call plug#end()
```
and run `:PlugInstall`

<br>

###### _Using **[pathogen](https://github.com/tpope/vim-pathogen)**:_

```bash
  git clone https://github.com/diovanii/vim-potion ~/.vim/bundle/vim-potion
```

## :memo: Usage

To set up the `<localleader>` add this line to your `.vimrc`.<br>
You can use whatever key you want

```vim
let maplocalleader=","
```

| Keymap           | Action                                |
|------------------|---------------------------------------|
| `<localleader>r` | Compile and run the current file      |
| `<localleader>b` | Show the bytecode of the current file |
| `[[`             | Go backwards one section              |
| `]]`             | Go forward one section                |
| `[]`             | Go backwards one function definition  |
| `][`             | Go forward one function definition    |

<br>

## :page_with_curl: License

###### This project is under the [Mozilla Public License 2.0](http://mozilla.org/MPL/2.0/)
