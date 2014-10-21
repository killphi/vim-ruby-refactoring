task :default => :ci

task :ci => [:vim_flavor, :check_stuff, :features]

desc 'outputs vim version, installs VimFlavors for testing and runs vspec tests'
task :vim_flavor do
  sh 'vim --version'
  sh 'vim-flavor test'
end

desc 'checks for directories and stuff'
task :check_stuff do
  sh 'ls .vim-flavor'
  sh 'ls .vim-flavor/deps'
end

desc 'run cucumber features'
task :features do
  sh 'cucumber'
end

desc 'format cucumber run as HTML'
task :html_features do
  sh 'cucumber --profile html'
end
