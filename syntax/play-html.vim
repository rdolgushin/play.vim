" Vim syntax file
" Language:	Play framework html
" Maintainer:	Roman Dolgushin <rd@roman-dolgushin.ru>
" URL:		http://github.com/rdolgushin/play.vim

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version < 600
  source <sfile>:p:h/html.vim
  source <sfile>:p:h/html/html5.vim
else
  runtime! syntax/html.vim
  runtime! syntax/html/html5.vim
endif
unlet b:current_syntax

syn region playHtmlTagBlock     start="#{" end="}"
syn region playHtmlVarBlock     start="${" end="}"
syn region playHtmlRouterBlock  start="@{" end="}"
syn region playHtmlMsgBlock     start="&{" end="}"
syn region playHtmlCommentBlock start="*{" end="}*"
syn region playHtmlScriptBlock  start="%{" end="}%"

if version >= 508 || !exists("did_play_html_syn_inits")
  if version < 508
    let did_rythm_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink playHtmlTagBlock     PreProc
  HiLink playHtmlVarBlock     PreProc
  HiLink playHtmlRouterBlock  PreProc
  HiLink playHtmlMsgBlock     PreProc
  HiLink playHtmlCommentBlock Comment
  HiLink playHtmlScriptBlock  PreProc

  delcommand HiLink
endif

let b:current_syntax = "play-html"
