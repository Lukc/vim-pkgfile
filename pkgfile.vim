" Pkgfiles syntax file.
" Language:   Pkgfiles
" Author:     Lukc <lukc@upyum.com>
" Copyright:  Copyright (c) 2012 Luka Vandervelden
" Licence:    BSD
" 
" Syntax highlighting for Pkgfiles and pkg++ recipes. Inherits
" from sh.vim, and adds the pkg++ specific tools highlighting
" for some functions and variables.

if &compatible || v:version < 603
	finish
endif

if exists("b:current_syntax")
	finish
endif

" Actually, we use zsh, but the bash syntax is the closest one.
let is_bash=1
runtime! syntax/sh.vim
unlet b:current_syntax

" sh.vim does not allow a certain number of characters in variables name, that
" are actually supported by zsh.
syn match shFunction  "^\s*\<\h[0-9a-zA-Z_\-\.:]*\>\s*()"      skipwhite skipnl contains=shFunctionParen

" Default functions and tools.
syn keyword PkgfileFunctions use use_enable use_with
syn keyword PkgfileFunctions has
syn keyword PkgfileFunctions autosplit
syn keyword PkgfileFunctions @\{ \}@

" Special variables definition
" FIXME: Does not work, right now.
syn match   PkgfileSpecialVariables /^\(name\|version\|release\|license\|description\|longdesc\|url\|packager\|maintainer\|depends\|builddepends\|rundepends\|lastver\)=/

" Inclusion
syn match   PkgfileInclude /^includes=(.*)/
" includes=() might be multiline.
syn match   PkgfileInclude /^includes=/
syn keyword PkgfileInclude include


" Misspelling. It’s license, dude.
syn keyword PkgfileError licence

" arch=() instead of archs=() is a bad thing. Idem for others.
syn match   PkgfileError /^\(arch\|kernel\)=/

syn match   PkgfileError /^lastver=["']\$(.*)["']/

" Linking? \o/

syn cluster shCommandSubList add=PkgfileFunctions

hi def link PkgfileFunctions          Keyword
hi def link PkgfileInclude            Include
hi def link PkgfileSpecialVariable    PreProc
hi def link PkgfileError              Error

let b:current_syntax="pkgfile"

