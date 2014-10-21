task :default => :ci

task :ci => [:vim_flavor, :features]

desc 'installs VimFlavors for testing and runs vspec tests'
task :vim_flavor do
  sh 'vim-flavor test'
end

desc 'run cucumber features'
task :features do
  sh 'cucumber'
end

desc 'format cucumber run as HTML'
task :html_features do
  sh 'cucumber --profile html'
end
