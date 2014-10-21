Then /^I see:$/ do |result|
  expect(result_of_executing_the_commands).to eq(result)
end

Then /^the result equals the file (\S+)$/ do |file|
  result = File.read File.join('test', 'feature_files', 'results', file + '.rb')
  result.strip!
  expect(result_of_executing_the_commands).to eq(result)
end

Then /^I see no errors in register (\S+)$/ do |register|
  append_register_to_body register
  expect(result_of_executing_the_commands).not_to include('Error')
end
