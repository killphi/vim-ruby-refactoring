When /^I execute:$/ do |command|
  add_to_commands command
end

When /^I execute (.+)$/ do |command|
  add_to_commands command
end

When /^I fill in `([^`]*)`$/ do |parameter|
  add_to_commands parameter
end

When /^I redirect output to register (\S+)$/ do |register|
  redirect_output_to register
end
