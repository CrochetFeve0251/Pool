@state_machine
Feature: Opening
  Pool open should let whitelist users stacking but not to widthdraw

  Scenario: Adding the pool should open it for 3 days
    Given Pool is not initialize
    When Pool is initialize
    Then Pool is open
    And Lock deadline is in 3 days

  Scenario Outline: Whitelist Users can join the pool by stacking their money
    Given Pool is open
    And User has <funds> Matic
    And User in whitelist
    When User stack <funds> Matic
    Then <funds> Matic should be stacked
    And Pool token should be awarded

    Examples:
      | funds |
      | 10    |
      | 50    |
      | 100   |

  Scenario Outline: Not Whitelist Users cannot join the pool
    Given Pool is open
    And User has <funds> Matic
    And User not in whitelist
    When User stack <funds> Matic
    Then <funds> Matic should not be stacked
    And Pool token should not be awarded

    Examples:
      | funds |
      | 10    |
      | 50    |
      | 100   |

  Scenario Outline: Whitelist Users can only stack one time
    Given Pool is open
    And User has <funds> Matic
    And User already stacked
    And User in whitelist
    When User stack <funds> Matic
    Then <funds> Matic should not be stacked
    And Pool token should not be awarded

    Examples:
      | funds |
      | 10    |
      | 50    |
      | 100   |

  Scenario Outline: User with stacked funds can't widthdraw
    Given Pool is open
    And User has stacked <funds> Matic
    When User widthdraw <funds> Matic
    Then <funds> Matic should not be withdraw

    Examples:
      | funds |
      | 10    |
      | 50    |
      | 100   |