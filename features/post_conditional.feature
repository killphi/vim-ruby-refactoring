Feature: Convert Post Conditional :RConvertPostConditional
  Takes a post-conditional expression and converts it into a regular conditional statement (and vice versa)

    Shortcuts:
      :RConvertPostConditional
      <leader>rcpc

  Scenario: Convert a simple if post-conditional expression
    Given I have the following code:
    """
    do_something if condition
    """
    When I execute :RConvertPostConditional
    Then I see:
    """
    if condition
      do_something
    end
    """

  Scenario: Convert a simple if pre-conditional expression from position if
    Given I have the following code:
    """
    if condition
      do_something
    end
    """
    When I go to the first line
    And I execute :RConvertPostConditional
    Then I see:
    """
    do_something if condition
    """

  Scenario: Convert a simple if pre-conditional expression from inline
    Given I have the following code:
    """
    if condition
      do_something
    end
    """
    When I go to line 2
    And I execute :RConvertPostConditional
    Then I see:
    """
    do_something if condition
    """
