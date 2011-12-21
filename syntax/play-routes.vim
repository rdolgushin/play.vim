" Vim syntax file
" Language: Play! routes file
" Author: Toby Matejovsky
" URL: https://github.com/tobym/vim-play
" Remarks: The method call match assumes the controllers package.

syntax include @Scala      syntax/scala.vim
syn match embeddedScala /controllers.\+)/ contains=@Scala " one method call starting with 'controllers' and ending with a ).

syn keyword playHttpVerb GET    nextgroup=playRoute skipwhite
syn keyword playHttpVerb POST   nextgroup=playRoute skipwhite
syn keyword playHttpVerb PUT    nextgroup=playRoute skipwhite
syn keyword playHttpVerb DELETE nextgroup=playRoute skipwhite

syn match playComment /#.*/
syn match playParameter ":\w\+" contained containedin=playRoute
syn match playRoute "\s/\S*"ms=s+1 contains=playParameter


hi def link playHttpVerb Preproc
hi def link playParameter Special
hi def link playRoute String
hi def link playComment Comment

