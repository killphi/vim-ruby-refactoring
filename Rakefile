task :ci => ['vim:test', 'vim:plugins', 'features:html']

namespace :vim do
  desc 'outputs vim version, installs VimFlavors for testing and runs vspec tests'
  task :test do
    sh 'vim --version'
    sh 'vim-flavor test'
  end

  desc 'checks for directories and stuff'
  task :plugins do
    sh 'ls -F .vim-flavor/deps'
  end
end

begin
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features)

  namespace :features do
    Cucumber::Rake::Task.new(:html) do |t|
      t.profile = 'html'
    end
  end

  task default: 'features:html'
rescue LoadError
  desc 'Cucumber not available'
  task :features do
    abort 'Cucumber is not available, please install it'
  end

  namespace :features do
    desc 'Cucumber not available'
    task :html do
      abort 'Cucumber is not available, please install it'
    end
  end
end
