# Note that <leader> is normally backslash, but many prefer this (in ~/.vimrc):
#   map <space> <leader>
# (So then these work as <space>rem, etc., as well as \rem)

class Buz
  def extract_method
    x = 1
    # Vjj to highlight a few of these, then do <leader>rem
    do_a
    do_b x
    do_c
  end
end

def inline_temp
  # start at the beginning of this line, then do <leader>rit
  x = 10 + 2
  puts x * x
end

def extract_local_var
  # Start on the '3' below, then do vg_<leader>relv
  2 + 3 / 100.0
  # TODO: make this work without 'v'
end

def convert_post_conditional
  # Go anywhere on this next line, then do <leader>rcpc (then do it again!)
  if cond
    do_something
  end

  # TODO: remap this as <leader>rcc or <leader>rfi (flip-if) ?
end

class Foo
  def extract_constant
    # Position the cursor on the '32343' below, then do vg_<leader>rec
    p 32343
    # TODO: make this work without 'v'
  end
end

class Foo
  def rename_instance_var
    # Start on 'bar', below, and do viw<leader>rriv
    @bar = foo
  end

  def method_two
    @bar = bar
  end
end
# But notice:
class Buz
  def this_bar_is_safe
    @bar = 55
  end
end

# rename local variable <leader>rrlv
def rename_local_variable
  # Start on either 'asdf', and do viw<leader>rrlv
  asdf = 10
  p asdf
  # TODO: make this work without 'v'
end
asdf = 55 # but this one is safe

def add_parameter one
  # <leader>rap[name of param] from here
  # FIXME: make this work with g:ruby_refactoring_sans_superfluous_syntax and
  # ditch RAddParameterNB (would cause <leader>rap to respond immediately)
end

# Skipping <leader>rel

# Skipping <leader>riv  (What does it do that "Ivarname =" doesn't?)
