# features/normal-checkout.feature
Feature: features/normal-checkout.feature
  A customer should be able to pay for an order

  Scenario: Add a product and do a checkout
    Given I am on the homepage
    Then I add a product to the cart
    And I wait for cart popup to load
    When I follow "Proceed to checkout"
    And I wait for the document ready event
    Then I should be on "/order"
    And I scroll to checkout button
    When I press the checkout button
    And I wait for the document ready event
    Then I should see "Create an account"
    And I fill in an email address on the user registration
    Then I wait for cart transition
    When I fill in the personal information
    And I press "submitAccount"
    Then I fill in the address form
    And I press "submitAddress"
    When I press "processAddress"
    Then I wait for cart transition
    And I Choose an shipping option
    Then I press "processCarrier"
    Then I wait for the document ready event
    And I should see "Please choose your payment method"
    When I follow "Pay by Payco"
    And I wait for the document ready event
    Then I switch to the iframe
    And I provide an card
    When I press "Continue"
    Then I wait for page redirect
    And I should see "Order confirmation"
    Then I get the order reference
    When I go to the Prestashop Admin Page
    And I should see "Dashboard"
    When I goto saved order in admin
    Then I should see an Payco Order Reference
    And I should see "Payco Refund"
    When I click on Prestashop close on any prompt
    Then I perform an capture of "4.00"
    When I wait for the document ready event
    Then I click on Prestashop close on any prompt
    And I should see "Successful update"
    When I fill in an refund of "1,00"
    Then I wait for the document ready event
    And I should see an refund
    Then I log out of the Prestashop admin

