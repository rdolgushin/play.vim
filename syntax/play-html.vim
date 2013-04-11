" Vim syntax file
" Language:	Play framework html
" Maintainer:	Roman Dolgushin <rd@roman-dolgushin.ru>
" URL:		http://github.com/rdolgushin/play.vim

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'html'
endif

runtime! syntax/html.vim
runtime! syntax/html/html5.vim
unlet b:current_syntax

syn include @groovy syntax/groovy.vim

syn match  playHtmlIdentifier   "[#@$&]"                 contained
syn region playHtmlTagBlock     start="[#@$&]{" end="}"  containedin=htmlString contains=@groovy,playHtmlIdentifier
syn region playHtmlScriptBlock  start="%{"      end="}%" containedin=ALL        contains=@groovy
syn region playHtmlCommentBlock start="\*{"     end="}\*"

command -nargs=+ HiLink hi def link <args>

HiLink playHtmlIdentifier   PreProc
HiLink playHtmlTagBlock     PreProc
HiLink playHtmlScriptBlock  PreProc
HiLink playHtmlCommentBlock Comment

delcommand HiLink

let b:current_syntax = "play-html"
