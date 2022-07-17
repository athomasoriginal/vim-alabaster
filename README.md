# Vim Alabaster Theme

recieved

> **WARNING**: This is incomplete and many changes likely to occur in the coming
> weeks. Please do not use if you're looking for something stable.

This is a port of [Tonsky's Alabaster Theme].  At this point in time it's
incomplete.  The goals I would like to achieve:

- [ ] Correct color names
  - [ ] light_gray is darker than med_gray
- [ ] Alabaster light theme (current progress: partial)
  - [ ] JS Syntax
  - [ ] Bash Syntax
  - [ ] Clojure Syntax (current progress: partial)
  - [ ] Rust Syntax
  - [ ] Markdown Syntax
  - [ ] Alabaster airline (current progress: partial)
- [ ] Alabaster dark theme
  - [ ] JS Syntax
  - [ ] Bash Syntax
  - [ ] Clojure Syntax
  - [ ] Rust Syntax
  - [ ] Markdown Syntax
  - [ ] Better name for `gray_green`
  - [ ] Alabaster airline (current progress: partial)
  - Our background color is the gruvbox which is different from sublime
    Alabaster dark.  Feels a little softer.
- [ ] Polish LSP colors
- [ ] Improve statusline coloring
  - The statusline is currently colored via the `genereate` script.  Let's have
    and easier way to handle this


Also note that i'm assuming that users are using nvim 6 min and tree-sitter.
This has only been tested in this scenario.

- [Install]
- [Build Colors]
- [Editing Colors]
- [Iterm2 Users]
- [Project Layout]


## Install

- Add `vim-alabaster` to your vim-plug config
  ```bash
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

- Open the `yml` file of your choice
- Edit said `yml` file
- Build colors
  ```bash
  ./generate alabaster-dark.yml > ./colors/alabaster-dark.vim
  ```
  > Run from the root of the project


## Editing Colors

- StatusLine
  - There are different modes and we can color them via the `generate` script.
- [Modifying Color Scheme Best Practices]
  - The color scheme not exactly right?  This guide can help in allowing you
    to customize for yourself before suggesting an upstream change.

## Iterm2 Users

- The cursor colour is controlled in iterm2 settings


## Project Layout

- `generate` + `lib/`
  - ruby code to dynamically generate a `.vim` syntax highlighting file.  See
    [vim-felipic] for the original source.

## Markdown Syntax Highlighting

- Notice that `inline`, **emphasis** and _italics_ etc are the `green_gray`
  - Tonsky's (sublime as the example) doesn't actually highlight the words
    themselves, but rather the wrapping characters.  I switched to the words
    themselves because I like them to standout as I often refer back to these
    words to be sure they are indeed things that deserve "special".

[Install]: #install
[Build Colors]: #build-colors
[Editing Colors]: #editing-colors
[Iterm2 Users]: #iterm2-users
[Project Layout]: #project-layout

[Tonsky's Alabaster Theme]: https://github.com/tonsky/sublime-scheme-alabaster
[vim-felipic]: https://github.com/felipec/vim-felipec
[Modifying Color Scheme Best Practices]: https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
