# Vim Alabaster Theme

> **WARNING**: This is incomplete and many changes likely to occur in the coming
> weeks. Please do not use if you're looking for something stable.

This is a port of [Tonsky's Alabaster Theme].  At this point in time it's
incomplete.  The goals I would like to achieve:

- [ ] Alabaster light theme (current progress: partial)
  - [ ] JS Syntax
  - [ ] Bash Syntax
  - [ ] Clojure Syntax (current progress: partial)
  - [ ] Rust Syntax
  - [ ] Markdown Syntax
  - [ ] Alabaster airline (current progress: partial)
- [x] Alabaster dark theme
  - [x] Clojure Syntax
  - [x] Markdown Syntax
  - [x] JS Syntax
  - [x] CSS syntax
  - [x] Bash Syntax
  - [x] Rust Syntax
- [ ] Correct color names
  - [ ] light_gray is darker than med_gray
  - [ ] Better name for `gray_green`
- [ ] Alabaster airline (current progress: partial)
- [ ] Polish LSP colors
- Custom Syntax File Builder
  - [ ] Explore nicer approach to building/writing strings
  - [ ] Add fn to convert hex to x256 - see `highlight-config`

Also note that i'm assuming that users are using nvim 6 min and tree-sitter.
This has only been tested in this scenario.

- [Install]
- [Build Colors]
- [Editing Colors]
- [Iterm2 Users]
- [Project Layout]


## Install

- Add `vim-alabaster` to your vim-plug config
  ```vim
  call plug#begin('~/.vim/plugged')
   ...
   Plug 'athomasoriginal/vim-alabaster'
   ...
  call plug#end()


  colorscheme alabaster
  # or
  colorscheme alabaster-dark
  ```
- Open nvim
- Ensure that you've installed the tree-sitter grammars you need


## Building Colors

- Open the `edn` file of your choice
- Edit said `edn` file
- Build colors
  ```command
  ./build.clj dark.edn
  ```
  > Run from the root of the project.  We assume you've installed [Babashka].
  > `build.clj` expects to be passed the name of a configuration file.


## Editing Colors

- StatusLine
  - There are different modes and we can color them via the `generate` script.
- [Modifying Color Scheme Best Practices]
  - The color scheme not exactly right?  This guide can help in allowing you
    to customize for yourself before suggesting an upstream change.
- Colors to consider
  - Cursor color
    - This should standout so you can quickly find where you are
  - Search Highlight
    - Note that it should complement the cursor color.
  - Number column to the left
    - We can fade these a little more.  Not a priority.

## Iterm2 Users

- The cursor colour is controlled in iterm2 settings
  - preferences >  profiles > colors > cursor colors

## Project Layout

- `build.clj`
  - A [Babashka] script to dynamically generate `.vim` syntax file from an
    `edn` config file.  Loosely ported from [vim-felipic].
- `language-samples`
  - A directory of the languages tested against this color scheme and filled
    with language syntax so we have something to test against.

## Markdown Syntax Highlighting

- Notice that `inline`, **emphasis** and _italics_ etc are the `green_gray`
  - Tonsky's (sublime as the example) doesn't actually highlight the words
    themselves, but rather the wrapping characters.  I switched to the words
    themselves because I like them to standout as I often refer back to these
    words to be sure they are indeed things that deserve "special".

## Research Notes

- [nvim syntax highlight]
- [highlight args]


[Install]: #install
[Build Colors]: #build-colors
[Editing Colors]: #editing-colors
[Iterm2 Users]: #iterm2-users
[Project Layout]: #project-layout

[Tonsky's Alabaster Theme]: https://github.com/tonsky/sublime-scheme-alabaster
[vim-felipic]: https://github.com/felipec/vim-felipec
[Modifying Color Scheme Best Practices]: https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
[Babashka]: https://github.com/babashka/babashka#quickstart
[nvim syntax highlight]: https://neovim.io/doc/user/treesitter.html#treesitter-highlight
[highlight args]: https://neovim.io/doc/user/syntax.html#highlight-args
