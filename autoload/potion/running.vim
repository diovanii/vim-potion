" PotionCompileAndRunFile: {{{
function! potion#running#PotionCompileAndRunFile()
  " Run Potion to compile and show the results on the screen
  silent! clear
  execute "!" . g:potion_path . " " . bufname("%")
endfunction
"}}}



" PotionShowBytecode: {{{
function! potion#running#PotionShowBytecode()
  write

  " If is already an open window, close it
  if bufwinnr('__Potion_Bytecode__') !=? -1
    execute "bdelete " . bufwinnr('__Potion_Bytecode__')
  endif

  " Get the bytecode
  let l:bytecode = system(g:potion_path . " -c -V " . bufname("%") . " 2>&1")

  " If is an error stop and show the message
  if index(split(l:bytecode), 'error') !=? -1
    let l:error_message = join(split(l:bytecode)[1:])

    echohl ErrorMsg
    echomsg "> " . l:error_message
    echohl NONE

    return
  endif

  " Open a new split and set it up
  vsplit __Potion_Bytecode__
  execute "%d"
  setlocal filetype=potionbytecode
  setlocal buftype=nofile

  " Insert the bytecode
  call append(0, split(l:bytecode, '\v\n'))
endfunction
"}}}
