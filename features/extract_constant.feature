Feature: Extract Constant :RExtractConstant
  Extracts the selected range into a constant at the top of the current module/class

    Shortcuts:
      :RExtractConstant
      <leader>rec

  Scenario: Extract a constant when there is no constant
    Given I have the test file extract_constant
    When I select expression `"some magic number"`
    And I execute :RExtractConstant
    And I fill in `magic string`
    Then the result equals the file extract_constant

  Scenario: Extract a constant when there is a newline after it
    Given I have the test file extract_constant
    And I go to the first line
    And I execute :put = ''
    When I select expression `"some magic number"`
    And I execute :RExtractConstant
    And I fill in `magic string`
    Then the result equals the file extract_constant

  Scenario: Extract a constant when there already is at least one constant
    Given I have the test file extract_constant
    And I go to the first line
    And I execute :put = ['  MAGIC_CONSTANT = \"blah\"', '']
    When I select expression `"some magic number"`
    And I execute :RExtractConstant
    And I fill in `magic string`
    Then the result equals the file extract_constant_with_constant

  Scenario: Extract a constant when there are multiple occurences
    Given I have the test file extract_constant_multiple
    When I select expression `"some magic number"`
    And I execute :RExtractConstant
    And I fill in `magic string`
    Then the result equals the file extract_constant_multiple
