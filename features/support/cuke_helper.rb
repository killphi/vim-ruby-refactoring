require 'robot-vim'


## Helper modules
#
module CommandHelpers
  RETURN_KEY = "\n"

  def commands
    @commands.join(RETURN_KEY) + RETURN_KEY
  end

  def redirect_output_to( register )
    @commands << %Q{:redir @#{register[0].upcase}}
  end

  def append_register_to_body( register )
    @commands << %Q{:normal G"#{register[0].downcase}p}
  end
end

module ResultHelpers
  def result_of_executing_the_commands
    vimrc = { vimrc: File.expand_path('test/vimrc') }
    args = { input_file: @input, commands: commands }
    RobotVim::Runner.new(vimrc).run(args).body
  end
end

module MovementHelpers
  def go_to_line( y )
    @commands << ":normal #{y}G"
  end

  def go_to_column( x )
    @commands << ":normal #{x}|"
  end

  def go_to_expression( expr )
    @commands << "/#{expr}"
  end
end


##

World CommandHelpers, MovementHelpers, ResultHelpers


## Hooks

Before do
  @commands = [':setf ruby']
end
