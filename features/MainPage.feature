@AutomatedTests
@MainPageSort

Feature: Main Page Scenarios

  Scenario: Product sort Price (high to low)
    Given I open the web page
    When I login as a "standard" user
    Then the sort "Price (high to low)" should work correctly

  Scenario: Product sort Price (low to high)
    Given I open the web page
    When I login as a "standard" user
    Then the sort "Price (low to high)" should work correctly

  Scenario: Product sort Name (Z to A)
    Given I open the web page
    When I login as a "standard" user
    Then the sort "Name (Z to A)" should work correctly

  Scenario: Product sort Name (A to Z)
    Given I open the web page
    When I login as a "standard" user
    Then the sort "Name (A to Z)" should work correctly