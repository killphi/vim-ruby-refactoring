When /^I execute:$/ do |command|
  @commands << command
end

When /^I execute (.+)$/ do |command|
  @commands << command
end

When /^I fill in `([^`]*)`$/ do |parameter|
  @commands << parameter
end

When /^I redirect output to register (\S+)$/ do |register|
  redirect_output_to register
end
