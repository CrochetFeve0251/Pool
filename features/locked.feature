@state_machine
Feature: Locked
  Pool locked should prevent users from widthdrawing or stacking funds

  Scenario Outline: User cannot stack funds
    Given Pool is locked
    And User has <funds> Matic
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
    Given Pool is locked
    And User has stacked <funds> Matic
    When User widthdraw <funds> Matic
    Then <funds> Matic should not be withdraw

    Examples:
      | funds |
      | 10    |
      | 50    |
      | 100   |

  Scenario Outline: User with stacked funds can widthdraw interests
    Given Pool is locked
    And User has stacked <funds> Matic
    When User widthdraw interest
    Then Interest should be widthdrawed

    Examples:
      | funds |
      | 10    |
      | 50    |
      | 100   |

  Scenario: User without stacked funds cannot widthdraw interests
    Given Pool is locked
    And User has not fund stacked
    When User widthdraw interest
    Then Interest should not be widthdrawed