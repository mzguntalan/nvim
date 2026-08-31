# nvim

![demo](https://github.com/mzguntalan/media_for_other_repo/blob/main/nvim/nvim_demo.png?raw=true)

## Overview

The following languages are supported by this human's nvim (LSP + treesitter + formatting)

- lua (lua_ls)
- python (pyright, isort, black, mypy)
- javascript / typescript / tsx (ts_ls, eslint, prettier)
- html / css (tailwindcss, prettier)
- json (prettier)
- markdown (marksman, vim-markdown, prettier)

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

### General

- Go to file browser: `<leader>pv`
- Preserve register when pasting over a selection: `<leader>p`
- Comment a line: `<leader>cv`
- Comment a block: `<leader>cc`
- Leap to a position: `<leader>;`
- Toggle undo tree: `<leader>u`
- Toggle terminal (float): `<C-\>`

### Find / Telescope

- Find file: `<leader>fa` (fa = find all)
- Live grep: `<leader>fg`
- Fuzzy search symbols (aerial): `<leader>fs`

### LSP (active while an LSP client is attached)

- Go to declaration: `gD`
- Go to definition: `gd`
- Hover docs: `gs`
- References: `<leader>rf`
- Rename symbol: `<leader>re`
- Code action: `<leader>af`
- Line diagnostics: `<leader>dd`
- Signature help (insert mode): `<C-k>`
- Toggle inlay hints: `<leader>i`
- Format buffer/selection (normal/visual): `<leader>f` (also runs automatically on save)

### UI / panels

- Toggle symbol outline (aerial): `<leader>o`
- Toggle buffer diagnostics (trouble): `<leader>t`
- Toggle workspace diagnostics (trouble): `<leader>tr`
- Toggle focus dimming (twilight): `<leader>tw`

### Fun

- Spawn a duck: `<leader>zcc`
- Cook the nearest duck: `<leader>zxc`
- Cook all ducks: `<leader>zxx`

## FAQ

- Q: Telescope does not ignore .gitignored files
  - A: install `ripgrep`
