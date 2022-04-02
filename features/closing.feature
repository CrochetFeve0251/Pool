@state_machine
Feature: Closing
  Pool closing should send back all funds and rewards

  Scenario Outline: Should return funds to Users
    Given Pool is closing
    And Max stacked <max_funds> Matic
    And Alex stacked <alex_funds> Matic
    And Pool remains <pool_funds> Matic
    When Change status to close
    Then Alex should get <alex_widthdraw> Matic
    And Alex has 0 Matic stacked
    And Max should get <max_widthdraw> Matic
    And Pool should be closed
    And Max has 0 Matic stacked

    Examples:
      | max_funds | alex_funds | pool_funds | max_widthdraw | alex_widthdraw |
      | 10        | 20         | 30         | 10            | 20             |
      | 40        | 10         | 200        | 160           | 40             |
      | 100       | 150        | 200        | 80            | 120            |

  Scenario Outline: Should give rewards to Users
    Given Pool is closing
    And User stacked <funds> Matic
    When Change status to close
    Then User should get its rewards
    And Pool should be closed

    Examples:
      | funds |
      | 10    |
      | 50    |
      | 100   |