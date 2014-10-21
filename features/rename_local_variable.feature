Feature: Rename Local Variable :RRenameLocalVariable
  Renames a local variable to be something more meaningful and intention revealing

    Shortcuts:
      :RRenameLocalVariable
      <leader>rrlv

  Scenario: Rename single occurance of a local variable
    Given I have the following code:
    """
    def method
      foo = 7
    end
    """
    When I select expression `foo`
    And I execute :RRenameLocalVariable
    And I fill in `days in week`
    Then I see:
    """
    def method
      days_in_week = 7
    end
    """
