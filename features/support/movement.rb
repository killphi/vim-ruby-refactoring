def go_to_line( y )
  add_to_commands ":normal #{y}G"
end

def go_to_column( x )
  add_to_commands ":normal #{x}|"
end

def go_to_expression( expr )
  add_to_commands "/#{expr}"
end
