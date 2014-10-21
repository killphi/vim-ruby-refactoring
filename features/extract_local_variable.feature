Feature: Extract Local Variable :RExtractLocalVariable
  Takes an expression that is being used directly and assigns it to a local variable first

    Shortcuts:
      :RExtractLocalVariable
      <leader>relv

  Scenario: Extract a local variable from a magic number
    Given I have the test file extract_local_variable
    When I select expression `"some magic number"`
    And I execute :RExtractLocalVariable
    And I fill in `local variable`
    Then the result equals the file extract_local_variable

  Scenario: Extract a local variable when there is a newline after it
    Given I have the test file extract_local_variable
    And I go to expression `def`
    And I execute :put = ''
    When I select expression `"some magic number"`
    And I execute :RExtractLocalVariable
    And I fill in `local variable`
    Then the result equals the file extract_local_variable

  Scenario: Extract a local variable when there already is at least one local variable
    Given I have the test file extract_local_variable
    And I go to expression `def`
    And I execute :put = ['    another_variable = \"blah\"', '']
    When I select expression `"some magic number"`
    And I execute :RExtractLocalVariable
    And I fill in `local variable`
    Then the result equals the file extract_local_variable_with_variable

  Scenario: Extract a local variable from a magic number with multiple occurances
    Given I have the test file extract_local_variable_multiple
    When I select expression `"some magic number"`
    And I execute :RExtractLocalVariable
    And I fill in `local variable`
    Then the result equals the file extract_local_variable_multiple
