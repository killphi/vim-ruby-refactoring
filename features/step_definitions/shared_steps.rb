Given /^I have the following code:$/ do |code|
  @input = code
end

Given /^variable (\S+) is set to (\S+)$/ do |variable, value|
  add_to_commands ":let #{variable} = #{value}"
end

When /^I fill in the parameter "([^"]*)"$/ do |parameter|
  add_to_commands parameter
end

When /^I go to line "([^"]*)" and execute:$/ do |line, command|
  go_to line
  add_to_commands command
end

When /^I go to the line and execute:$/ do |command|
  select_method
  add_to_commands command
end

Then /^I should see:$/ do |result|
  expect(result_of_executing_the_commands.strip).to eq(result.strip)
end
