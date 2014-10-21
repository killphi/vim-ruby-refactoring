Feature: Renaming instance variable :RRenameInstanceVariable

    Shortcuts:
      :RRenameInstanceVariable
      <leader>rriv

  Scenario: Renaming a single occurence of an instance variable
    Given I have the following code:
    """
    def method
      @instance_variable
    end
    """
    When I select expression `@instance_variable`
    And I execute :RRenameInstanceVariable
    And I fill in `foo bar`
    Then I see:
    """
    def method
      @foo_bar
    end
    """
