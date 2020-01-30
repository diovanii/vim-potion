setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)


function! s:GetNextNonBlankLine(line_number)
  let l:total_lines = line('$')
  let l:current_line = a:line_number + 1

  while l:current_line <= l:total_lines
    if getline(l:current_line) =~? '\v\S'
      return l:current_line
    endif

    let l:current_line += 1
  endwhile

  return -2
endfunction


function! s:GetIndentLevel(line_number)
  return indent(a:line_number) / &shiftwidth
endfunction


function! GetPotionFold(line_number)
  if getline(a:line_number) =~? '\v^\s*\$'
    return '-1'
  endif

  let l:current_indent_level = s:GetIndentLevel(a:line_number)
  let l:next_indent_level = s:GetIndentLevel(s:GetNextNonBlankLine(a:line_number))

  if l:next_indent_level == l:current_indent_level
    return l:current_indent_level

  elseif l:next_indent_level < l:current_indent_level
    return l:current_indent_level

  elseif l:next_indent_level > l:current_indent_level
    return '>' . l:next_indent_level
  endif
endfunction
