" File: VimCompleteReinsert.vim
" Author: Charles Gueunet
" Description: fill completion list using previous insert
" Last Modified: March 08, 2018

" Variables

" list conatining last inserted strings
let g:VCR_lastInserted = []

" maximum size of this list.
" a list too large may leads to performances issues
if(!exists('g:completeReinsertMaxSize'))
   let g:completeReinsertMaxSize = 100
endif

" Config

function! VimCompleteReinsert#complete() abort
   echom 'TODO, match in g:VCR_lastInserted'
   " let final_menu += [{'word':item, 'menu':m_info, 'kind':kind}]
endfunction

function! VimCompleteReinsert#addLastInsert() abort
   let l:lastInsert = @.
   " if composed of printable characet only and in one line
   if l:lastInsert =~? '\p*' && l:lastInsert !~? '\n'
      " it seems, still match the part after a navigation with attows
      call add(g:VCR_lastInserted, l:lastInsert)
      " Reduce size if needed
      if len(g:VCR_lastInserted) > g:completeReinsertMaxSize
      endif
   endif
endfunction

augroup completeReinsertFillList
   autocmd InsertLeave * call VimCompleteReinsert#addLastInsert()
augroup END
