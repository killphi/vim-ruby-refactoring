When /^I select \"@commands << return_key\"$/ do
  select_line
end

def select_line
  @commands << ":normal 7Gvg_"
end

When /^I select \"two \+ three\"$/ do
  select_lines
end

def select_lines
  @commands << ":normal 11G2wv$"
end

When /^I select the \"20\.times do\" block$/ do
  @commands << ":normal 7G^v2j$"
end

When /^I select \"x \+ y\"$/ do
  @commands << ":normal 4Gfxv$"
end

When /^I select \"a \+ \S+\"$/ do
  @commands << ":normal 2Gfav$"
end
