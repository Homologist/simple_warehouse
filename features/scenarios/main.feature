Feature: Move stuff in our storage
  I want to move stuff in my storage
  I see the input in the console

  Scenario: I want to remove a crate
    Given a grid of size 6 7
    And a square crate of size 1 product code 42 at position 3 2
    When I remove the crate at position 3 2
    Then I can't see the crate at position 3 2

  Scenario: I want to locate all crates
    Given a grid of size 6 7
    And a square crate of size 1 product code 42 at position 0 0
    And a square crate of size 1 product code 42 at position 1 4
    And a square crate of size 2 product code 43 at position 3 1
    When I locate crate of product code 42
    Then I can see all crate of product code 42

  Scenario: I want to create crate at wrong position
    Given a grid of size 6 7
    When a square crate of size 1 product code 42 at position 0 -1
    Then I get the message "Wrong position"

  Scenario: I want to create crate which doesn t fit bottom left
    Given a grid of size 6 7
    When a square crate of size 1 product code 42 at position 1 1
    When a square crate of size 2 product code 42 at position 0 0
    Then I get the message "I doesn t fit"

  Scenario: I want to create crate which doesn t fit top right
    Given a grid of size 6 7
    When a square crate of size 3 product code 42 at position 1 1
    When a square crate of size 2 product code 42 at position 2 2
    Then I get the message "I doesn t fit"

  Scenario: I want to remove a crate which doesn t exist
    Given a grid of size 6 7
    When I remove the crate at position 3 2
    Then I get the message "Crate doesn t exist"
