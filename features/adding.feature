Feature: Adding

  Scenario: Add two numbers
    Given the input "2+3"
    When the calculator is run
    Then the output should be "5"
