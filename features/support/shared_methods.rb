# This file will allow us to edit the vim runner
# configuration without having to edit every feature file
RETURN_KEY = "\n"

def result_of_executing_the_commands
  vimrc = { vimrc: File.expand_path("test/vimrc") }
  runner_args = { input_file: @input, commands: commands }
  RobotVim::Runner.new(vimrc).run(runner_args).body
end

def select_method
  first_line = "1"
  go_to first_line
end

def add_to_commands command
  @commands = "" if @commands.nil?
  @commands << command
  add_return_key
end

def set_filetype
 ":set ft=ruby" + RETURN_KEY
end

def commands
  set_filetype + @commands
end

def add_return_key
  @commands << RETURN_KEY
end

def go_to line
  add_to_commands ":normal #{line}G"
end
