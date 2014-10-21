def result_of_executing_the_commands
  vimrc = { vimrc: File.expand_path('test/vimrc') }
  args = { input_file: @input, commands: commands }
  RobotVim::Runner.new(vimrc).run(args).body
end
