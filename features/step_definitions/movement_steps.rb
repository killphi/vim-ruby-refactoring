When /^I go to the first line$/ do
  go_to_line 1
end

When /^I go to line (\d+)$/ do |num|
  go_to_line num
end

When /^I go to column (\d+)$/ do |num|
  go_to_column num
end

When /^I go to expression `([^`]*)`$/ do |expr|
  go_to_expression expr
end

When /^I select expression `([^`]*)`$/ do |expr|
  go_to_expression expr
  add_to_commands ":normal v#{expr.length - 1}l"
end

When /^I block select expression `([^`]*)` plus (\d+) lines$/ do |expr, lines|
  go_to_expression expr
  add_to_commands ":normal V#{lines}j"
end

When /^I select block from expression `([^`]*)`$/ do |expr|
  go_to_expression expr
  add_to_commands ":normal V%"
end
