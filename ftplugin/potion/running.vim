" If the Potion path isn't defined use Potion command instead
if !exists("g:potion_path")
  let g:potion_path = "potion"
endif


" Normal maps
nnoremap <buffer> <localleader>r :call potion#running#PotionCompileAndRunFile()<CR>
nnoremap <buffer> <localleader>b :call potion#running#PotionShowBytecode()<CR>
