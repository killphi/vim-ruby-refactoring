Feature: Introduce variable :RIntroduceVariable
  Take a method of instancated class and introduce variable

  Shortcuts:
    :RIntroduceVariable
    <leader>riv

  Scenario: Introduce variable from class
    Given I have the following code:
    """
    HelloWorld.new
    """
    When I execute :RIntroduceVariable
    Then I see:
    """
    hello_world = HelloWorld.new
    """

  Scenario: Introduce variable from method name
    Given I have the following code:
    """
    hello_world.person
    """
    When I execute :RIntroduceVariable
    Then I see:
    """
    person = hello_world.person
    """

  Scenario: Introduce variable when method has parameters
    Given I have the following code:
    """
    hello_world.person("Foo", "Bar")
    """
    When I execute :RIntroduceVariable
    Then I see:
    """
    person = hello_world.person("Foo", "Bar")
    """

  Scenario: Introduce variable when method has parameters that include method call
    Given I have the following code:
    """
    hello_world.person("Foo", Bar.new)
    """
    When I execute :RIntroduceVariable
    Then I see:
    """
    person = hello_world.person("Foo", Bar.new)
    """

  Scenario: Introduce variable when method has parameters that starts with a hash
    Given I have the following code:
    """
    hello_world.person {:foo => "bar}
    """
    When I execute :RIntroduceVariable
    Then I see:
    """
    person = hello_world.person {:foo => "bar}
    """

  Scenario: Introduce variable when method has parameters on the second method name
    Given I have the following code:
    """
    hello_world.person.name("Foo", Bar.new)
    """
    When I execute :RIntroduceVariable
    Then I see:
    """
    name = hello_world.person.name("Foo", Bar.new)
    """
