noremap <script> <buffer> <silent> [[ <nop>
noremap <script> <buffer> <silent> ]] <nop>

noremap <script> <buffer> <silent> [] <nop>
noremap <script> <buffer> <silent> ][ <nop>

function! s:NextSection(type, is_backwards, is_visual_mode)
  if a:is_visual_mode
    normal! gv
  endif

  if a:type == 1 " If you press ]] or [[
    let l:pattern = '\v(\n\n^\S|%^)'
    let l:search_flags = 'e'

  elseif a:type == 2 " If you press ][ or []
    let l:pattern = '\v^\S.*\=.*:$'
    let l:search_flags = ''
  endif

  if a:is_backwards " If you press [[ or []
    let l:search_direction = '?'
  else
    let l:search_direction = '/'
  endif

  execute 'silent normal! ' . l:search_direction . l:pattern . l:search_direction . l:search_flags . "\r"
endfunction

" Maps: {{{
noremap <script> <buffer> <silent> ]] :call <SID>NextSection(1, 0, 0)<CR>
noremap <script> <buffer> <silent> [[ :call <SID>NextSection(1, 1, 0)<CR>
noremap <script> <buffer> <silent> ][ :call <SID>NextSection(2, 0, 0)<CR>
noremap <script> <buffer> <silent> [] :call <SID>NextSection(2, 1, 0)<CR>
"}}}

" Visual maps: {{{
vnoremap <script> <buffer> <silent> ]] :<c-u>call <SID>NextSection(1, 0, 1)<CR>
vnoremap <script> <buffer> <silent> [[ :<c-u>call <SID>NextSection(1, 1, 1)<CR>
vnoremap <script> <buffer> <silent> ][ :<c-u>call <SID>NextSection(2, 0, 1)<CR>
vnoremap <script> <buffer> <silent> [] :<c-u>call <SID>NextSection(2, 1, 1)<CR>
"}}}
