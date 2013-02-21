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

syn region playHtmlTagBlock     start="#{"  end="}"  containedin=ALL
syn region playHtmlVarBlock     start="${"  end="}"  containedin=ALL
syn region playHtmlRouterBlock  start="@{"  end="}"  containedin=ALLBUT,playHtmlRRouterBlock
syn region playHtmlRRouterBlock start="@@{" end="}"  containedin=ALL
syn region playHtmlMsgBlock     start="&{"  end="}"  containedin=ALL
syn region playHtmlCommentBlock start="*{"  end="}*" containedin=ALL
syn region playHtmlScriptBlock  start="%{"  end="}%" containedin=ALL

command -nargs=+ HiLink hi def link <args>

HiLink playHtmlTagBlock     PreProc
HiLink playHtmlVarBlock     PreProc
HiLink playHtmlRouterBlock  PreProc
HiLink playHtmlRRouterBlock PreProc
HiLink playHtmlMsgBlock     PreProc
HiLink playHtmlCommentBlock Comment
HiLink playHtmlScriptBlock  PreProc

delcommand HiLink

let b:current_syntax = "play-html"
