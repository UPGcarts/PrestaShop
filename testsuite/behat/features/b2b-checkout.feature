# features/b2b-checkout.feature
Feature: features/normal-checkout.feature
  Scenario: A customer should be able to perform a b2b checkout
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
  Then I fill in the an company name with the address form
  And I press "submitAddress"
  When I press "processAddress"
  Then I wait for cart transition
  And I Choose an shipping option
  Then I press "processCarrier"
  Then I wait for the document ready event
  And I should see "Please choose your payment method"
  When I follow "Pay by Upg"
  And I wait for the document ready event
  Then I fill in the company details
  And I wait for the document ready event
  Then I switch to the iframe
  And I provide an card
  When I press "Continue"
  Then I wait for page redirect
  And I should see "Order confirmation"
  Then I get the order reference