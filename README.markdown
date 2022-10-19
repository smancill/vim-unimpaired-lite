# unimpaired.vim (slim version)

A fork of [unimpaired.vim](https://github.com/tpope/vim-unimpaired)
with a minimum set of mappings.

There are mappings which are simply short normal mode aliases for
commonly used ex commands. `]q` is :cnext. `[q` is :cprevious. `]a` is
:next.  `[b` is :bprevious.  See the documentation for the full set of
20 mappings and mnemonics.  All of them take a count.

And in the miscellaneous category, there's `[n` and `]n` to jump between
SCM conflict markers.

The `.` command works with all operator mappings.

## Installation

Install using your favorite package manager, or use Vim's built-in package
support:

    mkdir -p ~/.vim/pack/smancill/start
    cd ~/.vim/pack/smancill/start
    git clone https://github.com/smancill/vim-unimpaired-slim.git
    vim -u NONE -c "helptags unimpaired/doc" -c q

## License

Copyright (c) Tim Pope.  Distributed under the same terms as Vim itself.
See `:help license`.
