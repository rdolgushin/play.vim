au BufNewFile,BufRead *conf/routes  call SetPlayFiletype("play-routes")
au BufNewFile,BufRead *views/*.html call SetPlayFiletype("play-html")

" Will check for Play! 1.x and set specified filetype
function! SetPlayFiletype(ft)
  if filereadable("conf/application.conf")  " <- Checking for Play!
    if !filereadable("project/Build.scala") " <- Checking for not 2.0
      exec "set ft=" . a:ft
    endif
  endif
endfunction
