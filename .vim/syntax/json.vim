
<!-- saved from url=(0073)https://raw.github.com/mathiasbynens/dotfiles/master/.vim/syntax/json.vim -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css"></style></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">" Vim syntax file
" Language:     JSON
" Maintainer:   Jeroen Ruigrok van der Werven &lt;asmodai@in-nomine.org&gt;
" Last Change:  2009-06-16
" Version:      0.4
" {{{1

" Syntax setup {{{2
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

if !exists("main_syntax")
	if version &lt; 600
		syntax clear
	elseif exists("b:current_syntax")
		finish
	endif
	let main_syntax = 'json'
endif

" Syntax: Strings {{{2
syn region  jsonString    start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=jsonEscape
" Syntax: JSON does not allow strings with single quotes, unlike JavaScript.
syn region  jsonStringSQ  start=+'+  skip=+\\\\\|\\"+  end=+'+

" Syntax: Escape sequences {{{3
syn match   jsonEscape    "\\["\\/bfnrt]" contained
syn match   jsonEscape    "\\u\x\{4}" contained

" Syntax: Strings should always be enclosed with quotes.
syn match   jsonNoQuotes  "\&lt;\a\+\&gt;"

" Syntax: Numbers {{{2
syn match   jsonNumber    "-\=\&lt;\%(0\|[1-9]\d*\)\%(\.\d\+\)\=\%([eE][-+]\=\d\+\)\=\&gt;"

" Syntax: An integer part of 0 followed by other digits is not allowed.
syn match   jsonNumError  "-\=\&lt;0\d\.\d*\&gt;"

" Syntax: Boolean {{{2
syn keyword jsonBoolean   true false

" Syntax: Null {{{2
syn keyword jsonNull      null

" Syntax: Braces {{{2
syn match   jsonBraces   "[{}\[\]]"

" Define the default highlighting. {{{1
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version &gt;= 508 || !exists("did_json_syn_inits")
  if version &lt; 508
    let did_json_syn_inits = 1
    command -nargs=+ HiLink hi link &lt;args&gt;
  else
    command -nargs=+ HiLink hi def link &lt;args&gt;
  endif
  HiLink jsonString      String
  HiLink jsonEscape      Special
  HiLink jsonNumber      Number
  HiLink jsonBraces      Operator
  HiLink jsonNull        Function
  HiLink jsonBoolean     Boolean

  HiLink jsonNumError    Error
  HiLink jsonStringSQ    Error
  HiLink jsonNoQuotes    Error
  delcommand HiLink
endif

let b:current_syntax = "json"
if main_syntax == 'json'
	unlet main_syntax
endif
</pre><div id="sbi_camera_button" class="sbi_search" style="left: 0px; top: 0px; position: absolute; width: 29px; height: 27px; border: none; margin: 0px; padding: 0px; z-index: 2147483647; display: none;"></div></body></html>