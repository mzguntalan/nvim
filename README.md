# nvim

## Installation

### MacOS
1. Install nvim
```
brew install neovim
```
2. Install packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
3. Go to `config directory`
```
cd ~/.config
```
4. Clone this repo
```
git clone <get link in github>
```
5. Go inside
```
cd nvim
```
6. Start nvim and ignore errors using the Enter key (also called '<CR>')
```
nvim .
```
7. Use j(down), k(up), Enter(Go in/open). Find `lua/zolo/packer.lua`
8. Do the following step by step
9. Source the file
```
:so
```
10. Install Everything
```
:PackerSync
```
11. Press q and `:q!` to quit neovim
12. Reopen neovim by `nvim .`
13. It will re-initialize everything, if something breaks, quit `:q!` and reopen `nvim .`
14. For python, install black and reorder-python-imports via pip
```
pip install reorder-python-imports
pip install black
```
15. Install the language servers for python and markdown. By entering each one seperately
```
:MasonInstall jedi-language-server
:MasonInstall marksman
:MasonInstall mypy
```

## Basics/ Custom Keymaps (Not vim default)
- Leader = `<space>`
- Find a file `<leader>fa` (fa = find all)
- Go to file browser: `<leader>pv`
- Comment a line: `<leader>cv`
- Comment a block: `<leader>cc`
