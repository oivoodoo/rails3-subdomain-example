Feature: Manage accounts
  In order to manage
  accounts
  wants to be able to have access to manage accounts
  
  Scenario: View account
    Given I have "1" account
    And I go to the home page
      Then I should see "Accounts"
      And I should see "1" account
      And show me current url
