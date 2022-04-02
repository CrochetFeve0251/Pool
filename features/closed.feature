@state_machine
Feature: Closed
  Pool is closed making all operations impossible

  Scenario Outline: User cannot stack funds
    Given Pool is closed
    And User has <funds> Matic
    When User stack <funds> Matic
    Then <funds> Matic should not be stacked
    And Pool token should not be awarded

    Examples:
      | funds |
      | 10    |
      | 50    |
      | 100   |

  Scenario Outline: User with stacked funds cannot get them
    Given Pool is closed
    And User has <funds> Matic
    When User widthdraws funds
    Then Funds are not withdraw

    Examples:
      | funds |
      | 10    |
      | 50    |
      | 100   |