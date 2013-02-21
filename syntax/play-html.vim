" Vim syntax file
" Language:	Play framework html
" Maintainer:	Roman Dolgushin <rd@roman-dolgushin.ru>
" URL:		http://github.com/rdolgushin/play.vim

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'html'
endif

if version < 600
  source <sfile>:p:h/html.vim
  source <sfile>:p:h/html/html5.vim
else
  runtime! syntax/html.vim
  runtime! syntax/html/html5.vim
  unlet b:current_syntax
endif

syn region playHtmlTagBlock     start="#{"  end="}"  containedin=ALL
syn region playHtmlVarBlock     start="${"  end="}"  containedin=ALL
syn region playHtmlRouterBlock  start="@{"  end="}"  containedin=ALLBUT,playHtmlRRouterBlock
syn region playHtmlRRouterBlock start="@@{" end="}"  containedin=ALL
syn region playHtmlMsgBlock     start="&{"  end="}"  containedin=ALL
syn region playHtmlCommentBlock start="*{"  end="}*" containedin=ALL
syn region playHtmlScriptBlock  start="%{"  end="}%" containedin=ALL

if version >= 508 || !exists("did_play_html_syn_inits")
  if version < 508
    let did_play_html_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink playHtmlTagBlock     PreProc
  HiLink playHtmlVarBlock     PreProc
  HiLink playHtmlRouterBlock  PreProc
  HiLink playHtmlRRouterBlock PreProc
  HiLink playHtmlMsgBlock     PreProc
  HiLink playHtmlCommentBlock Comment
  HiLink playHtmlScriptBlock  PreProc

  delcommand HiLink
endif

let b:current_syntax = "play-html"
