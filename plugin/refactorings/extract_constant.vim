" Synopsis:
"   Extracts the selected scope into a constant at the top of the current
"   module or class
function! ExtractConstant()
  try
    let name = ruby_refactoring#get_input('Constant name: ', 'No constant name given!')
    let name = toupper(substitute(name, ' ', '_', 'g'))
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
  " Find the enclosing class or module
  exec '?\v<class|module>'
  " save cursor position
  let l:pos = getcurpos()
  " get line of class or module declaration
  let l:start = line('.')
  " goto end of block  -- needs matchit!
  normal %
  " get line of end of block
  let l:end = line('.')
  " substitute within block range
  exec l:start . ',' . l:end . l:sub . name . sflags
  " restore cursor position to class / module
  call setpos('.', l:pos)
  " Define the constant inside the class or module from register a
  exec 'normal! o' . name . " = \<Esc>\"ap=="

  " if line isn't a constant declaration or empty, we want a newline
  normal! j
  if match(getline('.'), '\v^(\s*[A-Z_][0-9A-Z_]+ = .+|\s*)$') == -1
    exec "normal! O\<Esc>"
  end
  normal! k
endfunction
