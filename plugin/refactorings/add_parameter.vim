" Synopsis:
"   Adds a parameter (or many separated with commas) to a method
function! AddParameter()
  try
    let name = common#get_input("Parameter name: ", "No parameter name given!")
  catch
    echo v:exception
    return
  endtry

  " Save current position
  let cursor_position = getpos(".")

  " Move backwards to the method definiton if you are not already on the
  " correct line
  if empty(matchstr(getline("."), '\<def\>'))
    exec "?\\<def\\>"
  endif

  " remove trailing whitespace
  s/\v\s$//e

  " brackets
  if g:ruby_refactoring_brackets_have_space == 1
    let bracket_open  = "( "
    let bracket_close = " )"
  else
    let bracket_open  = "("
    let bracket_close = ")"
  endif

  " test the line
  let line = getline(".")

  let has_only_brackets              = match(line, "\\vdef \\S+\\s*\\(\\s*\\)")
  let has_parameter_without_brackets = match(line, "\\vdef \\S+\\s+\\S+")
  let has_parameter_with_brackets    = match(line, "\\vdef \\S+\\(\\s*(\\S+\\s*)+\\)")
  let brackets_have_space            = match(line, "\\vdef \\S+\\((\\s+\\S+|\\S+\\s+)\\)")

  let l:command = "s/\\vdef \\S+\\zs"


  if has_only_brackets != -1
    exec l:command . "\\s*\\(\\s*\\)/" . bracket_open . name . bracket_close . "/"
  elseif has_parameter_with_brackets != -1
    exec l:command . "\\s*\\(\\s*(\\S+\\s*)+\\)/" . bracket_open . "\\1, " . name . bracket_close . "/"
  elseif has_parameter_without_brackets != -1
    exec l:command . "\\s+(\\S+\\s*)+/" . bracket_open . "\\1, " . name . bracket_close . "/"
  else
    exec "normal A" . bracket_open . name . bracket_close . "\<Esc>"
  endif

  " Restore caret position
  call setpos(".", cursor_position)
endfunction

