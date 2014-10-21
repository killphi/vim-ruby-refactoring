" Synopsis:
"   Extracts the selected scope to a variable
function! ExtractLocalVariable()
  try
    let name = ruby_refactoring#get_input('Variable name: ', 'No variable name given!')
    let name = tolower(substitute(name, ' ', '_', 'g'))
  catch
    echo v:exception
    return
  endtry

  " never ignore case, but do ignore errors
  let sflags = '/Ie'

  if !&gdefault
    " we want gsub
    let sflags .= 'g'
  end

  " Save the scope to register a
  normal! gv"ay
  " use register @a to create a search pattern
  let l:sub = 's/\V' . escape(@a, '\') . '/'
  " Find the enclosing method
  exec '?\v<def>'
  " save cursor position
  let l:pos = getcurpos()
  " get line of method declaration
  let l:start = line('.')
  " goto end of block  -- needs matchit!
  normal %
  " get line of end of block
  let l:end = line('.')
  " substitute within block range
  exec l:start . ',' . l:end . l:sub . name . sflags
  " restore cursor position to class / module
  call setpos('.', l:pos)
  " Define the local var inside the method from register a
  exec 'normal! o' . name . " = \<Esc>\"ap=="

  " if line isn't a variable declaration or empty, we want a newline
  normal! j
  if match(getline('.'), '\v^(\s*[a-z_][0-9a-z_]+ = .+|\s*)$') == -1
    exec "normal! O\<Esc>"
  end
  normal! k
endfunction
