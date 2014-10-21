# Feature: Extract Method :RExtractMethod
#   Extracts the selected code into a new method of its own.
#
#     Shortcuts:
#       :RExtractMethod
#       <leader>rem
#
#   Scenario: Extract one line assignment into a new method
#     Given I have the following code:
#     """
#     class Foo
#       def method_one
#         @bar = foo
#       end
#
#       def method_two
#         one = 1
#         two = 2
#         three = 3
#         four = two + two
#         five = two + three
#         six = five + one
#       end
#     end
#     """
#     When I select expression `two + three`
#     And I execute :RExtractMethod
#     And I fill in `add`
#     Then I see:
#     """
#     class Foo
#       def method_one
#         @bar = foo
#       end
#
#       def method_two
#         one = 1
#         two = 2
#         three = 3
#         four = two + two
#         five = add(two, three)
#         six = five + one
#       end
#
#       def add(two, three)
#         two + three
#       end
#     end
#     """
#
#   Scenario: Extract selected line to method with no parameter
#     Given I have the following code:
#     """
#     def return_key
#       "\n"
#     end
#
#     def select_method
#       @commands = ':normal gg'
#       @commands << return_key
#     end
#     """
#     When I select expression `@commands << return_key`
#     And I execute :RExtractMethod
#     And I fill in `add return key`
#     Then I see:
#     """
#     def return_key
#       "\n"
#     end
#
#     def select_method
#       @commands = ':normal gg'
#       add_return_key
#     end
#
#     def add_return_key
#       @commands << return_key
#     end
#     """
#
#   Scenario: Extract in an rspec file does not add lets as parameters
#     Given I have the following code:
#     """
#     require 'bowling'
#
#     describe Bowling,"score" do
#       let(:bowling) { Bowling.new }
#
#       it "should return 0 when rolling all gutter balls" do
#         20.times do
#           bowling.roll 0
#         end
#         expect(bowling.score).to eq(0)
#       end
#     end
#     """
#     When I select block from expression `20.times do`
#     And I execute :RExtractMethod
#     And I fill in `roll many`
#     Then I see:
#     """
#     require 'bowling'
#
#     describe Bowling,"score" do
#       let(:bowling) { Bowling.new }
#
#       it "should return 0 when rolling all gutter balls" do
#         roll_many
#         expect(bowling.score).to eq(0)
#       end
#
#       def roll_many
#         20.times do
#           bowling.roll 0
#         end
#       end
#     end
#     """
#
#   Scenario: Parameters to extracted method should be in the order they are declared in original method when declared on separate lines.
#     Given I have the following code:
#     """
#     def originalMethod
#       x = 1
#       y = 2
#       z = x + y
#     end
#     """
#     When I select expression `x + y`
#     And I execute :RExtractMethod
#     And I fill in `add`
#     Then I see:
#     """
#     def originalMethod
#       x = 1
#       y = 2
#       z = add(x, y)
#     end
#
#     def add(x, y)
#       x + y
#     end
#     """
#
#   Scenario: Parameters to extracted method should be in the order they are declared in original method when declared on same lines.
#     Given I have the following code:
#     """
#     def originalMethod(b, a)
#       c = a + b
#     end
#     """
#     When I select expression `a + b`
#     And I execute :RExtractMethod
#     And I fill in `add`
#     Then I see:
#     """
#     def originalMethod(b, a)
#       c = add(b, a)
#     end
#
#     def add(b, a)
#       a + b
#     end
#     """
