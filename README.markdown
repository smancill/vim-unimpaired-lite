# unimpaired.vim (slim version)

A fork of [unimpaired.vim](https://github.com/tpope/vim-unimpaired)
with a minimum set of mappings.

There are mappings which are simply short normal mode aliases for
commonly used ex commands. `]q` is :cnext. `[q` is :cprevious. `]a` is
:next.  `[b` is :bprevious.  See the documentation for the full set of
20 mappings and mnemonics.  All of them take a count.

There are mappings for toggling options. `[os` and `]os` perform `:set spell`
and `:set nospell`, respectively. There's also `l` (`list`), `n` (`number`),
`w` (`wrap`), plus mappings to help alleviate the `set paste` dance.
Consult the documentation.

And in the miscellaneous category, there's `[n` and `]n` to jump between
SCM conflict markers.

The `.` command works with all operator mappings, and will work with the
linewise mappings as well if you install
[repeat.vim](https://github.com/tpope/vim-repeat).

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
