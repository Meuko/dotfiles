" URL: https://github.com/mikowiec/vim-wallace
" Aurhor: Nikolay Kravets, nikolay.a.kravets@gmail.com
" Version: 1.0.0
" License: MIT


" :::::::::::::::::::: Bootstrap :::::::::::::::::::::::::::

hi clear
if exists('syntax_on') | syntax reset | endif
set background=dark
let g:colors_name = 'wallace'


" :::::::::::::::::::: Helper functions ::::::::::::::::::::

" Execute the 'highlight' command with a List of arguments.
function! s:Highlight(args)
  exec 'highlight ' . join(a:args, ' ')
endfunction

function! s:AddGroundValues(accumulator, ground, color)
  let new_list = a:accumulator
  for [where, value] in items(a:color)
    call add(new_list, where . a:ground . '=' . value)
  endfor

  return new_list
endfunction

function! s:Col(group, fg_name, ...)
  " ... = optional bg_name

  let pieces = [a:group]

  if a:fg_name !=# ''
    let pieces = s:AddGroundValues(pieces, 'fg', s:colors[a:fg_name])
  endif

  if a:0 > 0 && a:1 !=# ''
    let pieces = s:AddGroundValues(pieces, 'bg', s:colors[a:1])
  endif

  call s:Clear(a:group)
  call s:Highlight(pieces)
endfunction

function! s:Attr(group, attr)
  let l:attrs = [a:group, 'term=' . a:attr, 'cterm=' . a:attr, 'gui=' . a:attr]
  call s:Highlight(l:attrs)
endfunction

function! s:Clear(group)
  exec 'highlight clear ' . a:group
endfunction


" :::::::::::::::::::: Colors ::::::::::::::::::::::::::::::
" Let's store all the colors in a dictionary.
let s:colors = {}

" Base colors.
let s:colors.base0 = { 'gui': '#0c1014', 'cterm': 232 }
let s:colors.base1 = { 'gui': '#11151c', 'cterm': 233 }
let s:colors.base2 = { 'gui': '#091f2e', 'cterm': 17  }
let s:colors.base3 = { 'gui': '#0a3749', 'cterm': 18  }
let s:colors.base4 = { 'gui': '#1e6479', 'cterm': 31  }
let s:colors.base5 = { 'gui': '#599cab', 'cterm': 81  }
let s:colors.base6 = { 'gui': '#99d1ce', 'cterm': 122 }
let s:colors.base7 = { 'gui': '#d3ebe9', 'cterm': 194 }

" Other colors.
let s:colors.red     = { 'gui': '#c23127', 'cterm': 124 }
let s:colors.orange  = { 'gui': '#d26937', 'cterm': 166 }
let s:colors.yellow  = { 'gui': '#edb443', 'cterm': 214 }
let s:colors.magenta = { 'gui': '#888ca6', 'cterm': 67  }
let s:colors.violet  = { 'gui': '#4e5166', 'cterm': 60  }
let s:colors.blue    = { 'gui': '#195466', 'cterm': 24  }
let s:colors.cyan    = { 'gui': '#33859E', 'cterm': 44  }
let s:colors.green   = { 'gui': '#2aa889', 'cterm': 78  }

" Neovim :terminal colors.
let g:terminal_color_0  = get(s:colors.base0, 'gui')
let g:terminal_color_8  = g:terminal_color_0
let g:terminal_color_1  = get(s:colors.red, 'gui')
let g:terminal_color_9  = g:terminal_color_1
let g:terminal_color_2  = get(s:colors.green, 'gui')
let g:terminal_color_10 = g:terminal_color_2
let g:terminal_color_3  = get(s:colors.yellow, 'gui')
let g:terminal_color_11 = g:terminal_color_3
let g:terminal_color_4  = get(s:colors.blue, 'gui')
let g:terminal_color_12 = g:terminal_color_4
let g:terminal_color_5  = get(s:colors.violet, 'gui')
let g:terminal_color_13 = g:terminal_color_5
let g:terminal_color_6  = get(s:colors.cyan, 'gui')
let g:terminal_color_14 = g:terminal_color_6
let g:terminal_color_7  = get(s:colors.base6, 'gui')
let g:terminal_color_15 = g:terminal_color_7



" :::::::::::::::::::: Native highlighting :::::::::::::::::
" wallace Hi Groups: {{{
" common hi groups
call s:HL('wallaceFg0', s:fg0)
call s:HL('wallaceFg1', s:fg1)
call s:HL('wallaceFg2', s:fg2)
call s:HL('wallaceFg3', s:fg3)
call s:HL('wallaceFg4', s:fg4)
call s:HL('wallaceGray', s:gray)
call s:HL('wallaceBg0', s:bg0)
call s:HL('wallaceBg1', s:bg1)
call s:HL('wallaceBg2', s:bg2)
call s:HL('wallaceBg3', s:bg3)
call s:HL('wallaceBg4', s:bg4)
" -----
call s:HL('wallaceRed', s:red)
call s:HL('wallaceRedBold', s:red, s:none, s:bold)
call s:HL('wallaceGreen', s:green)
call s:HL('wallaceGreenBold', s:green, s:none, s:bold)
call s:HL('wallaceYellow', s:yellow)
call s:HL('wallaceYellowBold', s:yellow, s:none, s:bold)
call s:HL('wallaceBlue', s:blue)
call s:HL('wallaceBlueBold', s:blue, s:none, s:bold)
call s:HL('wallacePurple', s:purple)
call s:HL('wallacePurpleBold', s:purple, s:none, s:bold)
call s:HL('wallaceAqua', s:aqua)
call s:HL('wallaceAquaBold', s:aqua, s:none, s:bold)
call s:HL('wallaceOrange', s:orange)
call s:HL('wallaceOrangeBold', s:orange, s:none, s:bold)
"-----
call s:HL('wallaceRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('wallaceGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('wallaceYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('wallaceBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('wallacePurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('wallaceAquaSign', s:aqua, s:sign_column, s:invert_signs)
" }}}




" :::::::::::::::::::: Native highlighting :::::::::::::::::

let s:background = 'base0'
let s:linenr_background = 'base1'

" Everything starts here.
call s:Col('Normal', 'base6', s:background)

" Line, cursor and so on.
call s:Col('Cursor', 'base1', 'base6')
call s:Col('CursorLine', '', 'base1')
call s:Col('CursorColumn', '', 'base1')

" Sign column, line numbers.
call s:Col('LineNr', 'blue', s:linenr_background)
call s:Col('CursorLineNr', 'base5', s:linenr_background)
call s:Col('SignColumn', '', s:linenr_background)
call s:Col('ColorColumn', '', s:linenr_background)

" Visual selection.
call s:Col('Visual', '', 'base3')

" Easy-to-guess code elements.
call s:Col('Comment', 'blue')
call s:Col('String', 'green')
call s:Col('Number', 'orange')
call s:Col('Statement', 'base5')
call s:Col('Special', 'orange')
call s:Col('Identifier', 'base5')

" Constants, Ruby symbols.
call s:Col('Constant', 'magenta')

" Some HTML tags (<title>, some <h*>s)
call s:Col('Title', 'orange')

" <a> tags.
call s:Col('Underlined', 'yellow')
call s:Attr('Underlined', 'underline')

" Types, HTML attributes, Ruby constants (and class names).
call s:Col('Type', 'orange')

" Stuff like 'require' in Ruby.
call s:Col('PreProc', 'red')

" Tildes on the bottom of the page.
call s:Col('NonText', 'blue')

" Concealed stuff.
call s:Col('Conceal', 'cyan', s:background)

" TODO and similar tags.
call s:Col('Todo', 'magenta', s:background)

" The column separating vertical splits.
call s:Col('VertSplit', 'blue', s:linenr_background)
call s:Col('StatusLineNC', 'blue', 'base2')

" Matching parenthesis.
call s:Col('MatchParen', 'base1', 'orange')

" Special keys, e.g. some of the chars in 'listchars'. See ':h listchars'.
call s:Col('SpecialKey', 'base3')

" Folds.
call s:Col('Folded', 'base6', 'blue')
call s:Col('FoldColumn', 'base5', 'base3')

" Searching.
call s:Col('Search', 'base2', 'yellow')
call s:Attr('IncSearch', 'reverse')

" Popup menu.
call s:Col('Pmenu', 'base6', 'base2')
call s:Col('PmenuSel', 'base7', 'blue')
call s:Col('PmenuSbar', '', 'base2')
call s:Col('PmenuThumb', '', 'blue')

" Command line stuff.
call s:Col('ErrorMsg', 'red', 'base1')
call s:Col('Error', 'red', 'base1')
call s:Col('ModeMsg', 'blue')
call s:Col('WarningMsg', 'red')

" Wild menu.
" StatusLine determines the color of the non-active entries in the wild menu.
call s:Col('StatusLine', 'base5', 'base2')
call s:Col('WildMenu', 'base7', 'cyan')

" The 'Hit ENTER to continue prompt'.
call s:Col('Question', 'green')

" Tab line.
call s:Col('TabLineSel', 'base7', 'blue')  " the selected tab
call s:Col('TabLine', 'base6', 'base2')     " the non-selected tabs
call s:Col('TabLineFill', 'base0', 'base0') " the rest of the tab line

" Spelling.
call s:Col('SpellBad', 'base7', 'red')
call s:Col('SpellCap', 'base7', 'blue')
call s:Col('SpellLocal', 'yellow')
call s:Col('SpellRare', 'base7', 'violet')

" Diffing.
call s:Col('DiffAdd', 'base7', 'green')
call s:Col('DiffChange', 'base7', 'blue')
call s:Col('DiffDelete', 'base7', 'red')
call s:Col('DiffText', 'base7', 'cyan')
call s:Col('DiffAdded', 'green')
call s:Col('DiffChanged', 'blue')
call s:Col('DiffRemoved', 'red')
call s:Col('DiffSubname', 'blue')

" Directories (e.g. netrw).
call s:Col('Directory', 'cyan')


" :::::::::::::::::::: Languages Support :::::::::::::::::::
" Markdown, HTML
call s:Col('htmlArg', 'blue')
call s:Col('htmlItalic', 'magenta')
call s:Col('htmlBold', 'cyan', '')


" :::::::::::::::::::: Cleanup :::::::::::::::::::::::::::::
unlet s:colors
unlet s:background
unlet s:linenr_background






