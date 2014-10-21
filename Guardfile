# A sample Guardfile
# More info at https://github.com/guard/guard#readme

def glob_feature( match )
  Dir["**/#{match[1]}*.feature"] or 'features'
end

guard 'cucumber', cli: '--profile html', notification: false do
  watch(%r{^features/.+\.feature$})
  watch(%r{^(features/support|autoload)/.+$})           { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { 'features' }
  watch(%r{^plugin/refactorings/(.+)\.(vim|rb)$})       {|m| glob_feature m }
end

guard :shell do
  watch(%r{t/(.+)\.vim}) {|m| `vim-flavor test #{m[0]}` }
end

guard 'livereload' do
  watch(%r{test/reports/.+\.(css|js|html)})
end
