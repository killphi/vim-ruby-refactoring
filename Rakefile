task :default => :features

desc 'run cucumber features'
task :features do
  sh 'cucumber -f progress'
end

desc 'format cucumber run as HTML'
task :html_features do
  sh 'cucumber -f html -o test/report.html'
end
