# Vim Alabaster Theme

> **WARNING**: This is incomplete and many changes likely to occur in the coming weeks. Please do not use if you're looking 
> for something stable.

This is a port of [Tonsky's Alabaster Theme].  At this point in time it's incomplete.  The goals I would like to achieve:

- [ ] Alabaster light theme (partial)
- [ ] Alabaster dark theme
- [ ] Alabaster airline theme (partial)


Also note that I am assuming that users are using nvim 6 min and tree-sitter.  This has only been tested in this scenario.


## Install

- Add `vim-alabaster` to your vim-plug config
  ```bash
  call plug#begin('~/.vim/plugged')
   ...
   Plug 'athomasoriginal/vim-alabaster'
   ...
  call plug#end()
  ```
- Open nvim
- Ensure that you've installed the tree-sitter grammars you need


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


[Tonsky's Alabaster Theme]: https://github.com/tonsky/sublime-scheme-alabaster
[vim-felipic]: https://github.com/felipec/vim-felipec