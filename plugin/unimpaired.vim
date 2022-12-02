" unimpaired.vim - Pairs of handy bracket mappings (lite version)
" Maintainer:   Sebastián Mancilla
" Author:       Tim Pope <http://tpo.pe/>
" Version:      2.1

if exists("g:loaded_unimpaired") || &cp || v:version < 700
  finish
endif
let g:loaded_unimpaired = 1

function! s:Map(...) abort
  let [mode, head, rhs; rest] = a:000
  let flags = get(rest, 0, '') . (rhs =~# '^<Plug>' ? '' : '<script>')
  let tail = ''
  let keys = get(g:, mode.'remap', {})
  if type(keys) == type({}) && !empty(keys)
    while !empty(head) && len(keys)
      if has_key(keys, head)
        let head = keys[head]
        if empty(head)
          let head = '<skip>'
        endif
        break
      endif
      let tail = matchstr(head, '<[^<>]*>$\|.$') . tail
      let head = substitute(head, '<[^<>]*>$\|.$', '', '')
    endwhile
  endif
  if head !=# '<skip>' && empty(maparg(head.tail, mode))
    return mode.'map ' . flags . ' ' . head.tail . ' ' . rhs
  endif
  return ''
endfunction

" Section: Next and previous

function! s:MapNextFamily(map, cmd, current) abort
  let prefix = '<Plug>(unimpaired-' . a:cmd
  let map = '<Plug>unimpaired'.toupper(a:map)
  let cmd = '".(v:count ? v:count : "")."'.a:cmd
  let zv = (a:cmd ==# 'l' || a:cmd ==# 'c' ? 'zv' : '')
  let end = '"<CR>'.zv
  execute 'nnoremap <silent> '.prefix.'previous) :<C-U>exe "'.cmd.'previous'.end
  execute 'nnoremap <silent> '.prefix.'next)     :<C-U>exe "'.cmd.'next'.end
  execute 'nnoremap '.prefix.'first)    :<C-U><C-R>=v:count ? v:count . "' . a:current . '" : "' . a:cmd . 'first"<CR><CR>' . zv
  execute 'nnoremap '.prefix.'last)     :<C-U><C-R>=v:count ? v:count . "' . a:current . '" : "' . a:cmd . 'last"<CR><CR>' . zv
  execute 'nnoremap <silent> '.map.'Previous :<C-U>exe "'.cmd.'previous'.end
  execute 'nnoremap <silent> '.map.'Next     :<C-U>exe "'.cmd.'next'.end
  execute 'nnoremap <silent> '.map.'First    :<C-U>exe "'.cmd.'first'.end
  execute 'nnoremap <silent> '.map.'Last     :<C-U>exe "'.cmd.'last'.end
  exe s:Map('n', '['.        a:map , prefix.'previous)')
  exe s:Map('n', ']'.        a:map , prefix.'next)')
  exe s:Map('n', '['.toupper(a:map), prefix.'first)')
  exe s:Map('n', ']'.toupper(a:map), prefix.'last)')
endfunction

call s:MapNextFamily('a', '' , 'argument')
call s:MapNextFamily('b', 'b', 'buffer')
call s:MapNextFamily('l', 'l', 'll')
call s:MapNextFamily('q', 'c', 'cc')
call s:MapNextFamily('t', 't', 'trewind')

" vim:set sw=2 sts=2:
