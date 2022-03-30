# Vim Alabaster Theme

**WARNING**: Don't use this yet.  I'm just a toy project for now.


## Install

**NOTE:** These color scheme assume you're using tree-sitter.

- Add `vim-alabaster` to your vim-plug config
  ```bash
  call plug#begin('~/.vim/plugged')
   ...
   Plug 'athomasoriginal/vim-alabaster'
   ...
  call plug#end()
  ```

## Editing Colors

- Open the `yml` file of your choice
- Edit said `yml` file
- Build colors
  ```bash
  ./generate color-file.yml > ./colors/color-file.yml
  ```
  > Run from the root of the project

## Iterm2 Users

- The cursor colour is controlled in iterm2 settings

## Project Layout

- `generate` + `lib/`
  - ruby code to dynamically generate a `.vim` syntax highlighting file.  See [vim-felipic] for the original source.


[vim-felipic]: https://github.com/felipec/vim-felipec