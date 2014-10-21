Given /^I have the following code:$/ do |code|
  @input = code
end

Given /^I have the test file (\S+)$/ do |file|
  @input = File.read File.join('test', 'feature_files', file + '.rb')
  @input.strip!
end

Given /^the variable (\S+) is set to (.+)$/ do |variable, value|
  add_to_commands ":let #{variable} = #{value}"
end
