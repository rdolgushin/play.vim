" File:         play.vim
" Description:  Play! framework plugin for Vim
" Author:       Roman Dolgushin <rd@roman-dolgushin.ru>
" URL:          https://github.com/rdolgushin/play.vim

" Support of tComment
if exists('loaded_tcomment')
  call tcomment#DefineType('play-html', '*{ %s }*')
  call tcomment#DefineType('play-routes', '# %s')
end
