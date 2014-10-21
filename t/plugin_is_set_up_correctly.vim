runtime! plugin/ruby-refactoring.vim

describe 'ruby-refactoring'
  it 'is loaded'
    Expect exists('g:loaded_ruby_refactoring') to_be_true
    Expect g:loaded_ruby_refactoring == 1
  end

  it 'has parentheses style 1'
    Expect exists('g:ruby_refactoring_parentheses_style') to_be_true
    Expect g:ruby_refactoring_parentheses_style == 1
  end

  it 'loads the key maps'
    Expect exists('g:ruby_refactoring_map_keys') to_be_true
    Expect g:ruby_refactoring_map_keys == 1
  end

  it 'loaded matchit'
    Expect exists('g:loaded_matchit') to_be_true
  end
end
