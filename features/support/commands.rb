def commands
 ':setf ruby' + RETURN_KEY + @commands
end

def add_to_commands( command, return_key = true )
  @commands << command
  @commands << RETURN_KEY if return_key
end

def redirect_output_to( register )
  add_to_commands %Q{:redir @#{register[0].upcase}}
end

def append_register_to_body( register )
  add_to_commands %Q{:normal G"#{register[0].downcase}p}
end
