# features/normal-checkout.feature
Feature: features/Paypal-Cancellation-Error
  A customer should be returned to the iframe if paypal is cancelled or an error happens in paypal

  Scenario: Cancel a paypal order and I should be returned to site with an iframe
    Given I am on the homepage
    Then I log out of prestashop store
    And  I am on the homepage
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
    And I select paypal
    When I press "Continue"
    Then I wait for page redirect
    And I cancel paypal
    When I wait for page redirect
    Then I should see the payco iframe
