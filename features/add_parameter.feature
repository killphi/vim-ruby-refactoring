Feature: Add Parameter :RAddParameter with g:ruby_refactoring_parentheses_style = 1 (standard)
  This refactoring should add a new parameter to a method definition, regardless of how many the method already has.
  It should also use parentheses like `def name(param)`

    Shortcuts:
      :RAddParameter
      <leader>rap

  Scenario: Add a parameter to a method defined with no parameters or parentheses
    Given I have the test file add_parameter
    When I go to the first line
    And I execute :RAddParameter
    And I fill in `foo`
    Then the result equals the file add_parameter-1

  Scenario: Add a parameter to a method defined with no parameters
    Given I have the test file add_parameter
    When I go to the first line
    And I execute :RAddParameter
    And I fill in `foo`
    Then the result equals the file add_parameter_parentheses-1

  Scenario: Add a parameter to a method with an existing parameter
    Given I have the test file add_parameter_parameter_parentheses
    When I go to the first line
    And I execute :RAddParameter
    And I fill in `bar`
    Then the result equals the file add_parameter_parameter_parentheses-1

  Scenario: Add a parameter to a method with an existing parameter but not brackets
    Given I have the test file add_parameter_parameter
    When I go to the first line
    And I execute :RAddParameter
    And I fill in `bar`
    Then the result equals the file add_parameter_parameter-1

  Scenario: Add a parameter to a method with two existing parameters
    Given I have the test file add_parameter_2parameter_parentheses
    When I go to the first line
    And I execute :RAddParameter
    And I fill in `baz`
    Then the result equals the file add_parameter_2parameter_parentheses-1

  Scenario: Add a parameter to a method with two existing parameters but not brackets
    Given I have the test file add_parameter_2parameter
    When I go to the first line
    And I execute :RAddParameter
    And I fill in `baz`
    Then the result equals the file add_parameter_2parameter-1
