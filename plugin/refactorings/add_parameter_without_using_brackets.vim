" Synopsis:
"   Adds a parameter (or many separated with commas) to a method with no
"   brackets
function! AddParameterNB()
  try
    let name = ruby_refactoring#get_input("Parameter name: ", "No parameter name given!")
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

  " remove brackets
  s/\v\s*\( ?/ /e
  s/\v\s*\)//e

  " test the line
  let has_parameter = match(getline("."), "\\vdef \\S+\\s+\\S+")


  if has_parameter != -1
    exec "normal A, " . name . "\<Esc>"
  else
    exec "normal A " . name . "\<Esc>"
  endif

  " Restore caret position
  call setpos(".", cursor_position)
endfunction

