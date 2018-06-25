Feature: Move stuff in our storage
  I want to move stuff in my storage
  I see the input in the console

  Scenario: I want move a crate
    Given a grid
    And a square crate of size 1 product code 42 at position 3 2
    When I remove the crate at position 3 2
    Then I can't see the crate at position 3 2

  Scenario: I want locate all crates
    Given a grid
    And a square crate of size 1 product code 42 at position 0 0
    And a square crate of size 1 product code 42 at position 1 4
    And a square crate of size 2 product code 43 at position 3 1
    When I locate crate of product code 42
    Then I can see all crate of product code 42
