<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\MinkExtension\Context\RawMinkContext;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;

class FeatureContext extends RawMinkContext implements Context, SnippetAcceptingContext
{


    private $prestashopAdminContext;

    private $guesser;
    private $name;
    private $faker;

    private $orderReference;

    /** @BeforeScenario */
    public function gatherContexts(BeforeScenarioScope $scope)
    {
        date_default_timezone_set('Europe/London');
        $this->faker = \Faker\Factory::create();

        $this->faker->addProvider(new Faker\Provider\en_GB\PhoneNumber($this->faker));
        $this->guesser = new EdmondsCommerce\FakerContext\Guesser(\Faker\Factory::create());

        $enviroment = $scope->getEnvironment();
        $this->prestashopAdminContext = $enviroment->getContext('PrestaShopAdminContext');
    }

    /**
     * @BeforeStep
     */
    public function slowDown()
    {
        $this->getSession()->wait(1000);
    }

    /**
     * @Then I add a product to the cart
     */
    public function addAProductToTheCart()
    {
        $selector = '.button-container .ajax_add_to_cart_button';
        $elements = $this->getSession()->getPage()->findAll("css", $selector);
        if(count($elements) == 0){
            throw new \Exception("Product could not be found");
        }

        /**
         * @var Behat\Mink\Element\Element $element
         */
        $element = current($elements);

        $element->click();
    }

    /**
     * @Then I fill in an email address on the user registration
     */
    public function fillInEmailAddress()
    {
        $email = $this->faker->email;
        $this->email = $email;

        $field = 'email_create';
        $this->getSession()->getPage()->fillField($field, $email);

        $this->getSession()->getPage()->find('css','#SubmitCreate')->click();
    }

    /**
     * @Then /^I wait for cart popup to load/
     */
    public function iWaitForCartPopupToLoad()
    {
        $this->getSession()->wait(5000);
    }

    /**
     * @Then /^I wait for cart transition/
     */
    public function iWaitForCartAjaxTransition()
    {
        $this->getSession()->wait(5000);
    }

    /**
     * @Then /^I wait for page redirect/
     */
    public function iWaitForPageRedirect()
    {
        $this->getSession()->wait(10000);
    }

    /**
     * @Then I wait for the document ready event
     * @Then I wait for the page to fully load
     */
    public function iWaitForDocumentReady()
    {
        $this->getSession()->wait(10000, '("complete" === document.readyState)');
    }

    /**
     * @Then /^I wait for page to load/
     */
    public function iWaitForPageToLoad()
    {
        $this->getSession()->wait(9000);
    }

    /**
     * @Then /^I fill in the personal information/
     */
    public function iFillPersonalInformation()
    {
        $generator = new Faker\Provider\Internet($this->faker);

        $customerFirstname  = $this->faker->firstName;
        $customerLastname = $this->faker->firstName;

        $this->name = $customerFirstname.' '.$customerLastname;

        $password = $generator->password(6,10);

        $this->getSession()->getPage()->fillField('email', $this->email);
        $this->getSession()->getPage()->fillField('customer_firstname', $customerFirstname);
        $this->getSession()->getPage()->fillField('customer_lastname', $customerFirstname);
        $this->getSession()->getPage()->fillField('passwd', $password);
        $this->getSession()->getPage()->find('css','#uniform-id_gender1')->click();
    }

    /**
     * @Then /^I fill in the address form/
     */
    public function iFillInTheAddressForm()
    {
        $address1 = $this->faker->streetAddress;
        $city = $this->faker->city;
        $postcode = $this->faker->postcode;
        $phoneNumber = $this->faker->phoneNumber;

        $this->getSession()->getPage()->fillField('address1', $address1);
        $this->getSession()->getPage()->fillField('city', $city);
        $this->getSession()->getPage()->fillField('postcode', $postcode);
        $this->getSession()->getPage()->fillField('phone', $phoneNumber);
    }

    /**
     * @Then /^I fill in the an company name with the address form/
     */
    public function iFillInTheAddressFormWithCompanyName()
    {
        $this->iFillInTheAddressForm();
        $company = $this->faker->company;
        $this->getSession()->getPage()->fillField('company', $company);
    }

    /**
     * @Then /^I fill in the company details/
     */
    public function iFillInCompanyDetails()
    {
        $this->getSession()->getPage()->fillField('companyRegistrationID', 100);
        $this->getSession()->getPage()->fillField('companyVatID', 200);
        $this->getSession()->getPage()->fillField('companyTaxID', 300);
        $this->getSession()->getPage()->selectFieldOption('companyRegisterType', 'HRB');
        $this->getSession()->getPage()->find('css','input[type="submit"]')->click();
    }

    /**
     * @Then /^I press the checkout button/
     */
    public function iPressTheCheckoutButton()
    {
        $this->getSession()->getPage()->find('css','.standard-checkout')->click();
    }

    /**
     * @Then /^I scroll to checkout button/
     */
    public function scrollToCheckout()
    {
        //$this->iScrollTo('HOOK_SHOPPING_CART');
    }

    private function iScrollTo($id)
    {
        $this->getSession()->evaluateScript("document.getElementById('" . $id . "').scrollIntoView();");
    }

    /**
     * @Then /^I Choose an shipping option/
     */
    public function iChooseAnShippingOption()
    {
        $this->getSession()->getPage()->find('css','#cgv')->click();
    }

    /**
     * @Then /^I switch to the iframe/
     */
    public function iSwitchToTheIframe()
    {
        $this->getSession()->switchToIFrame('upg_iframe');
    }

    /**
     * @Then /^I should see the payco iframe/
     */
    public function iShouldSeeThePaycoIframe()
    {
        $element = $this->getSession()->getPage()->find('css','#upg_iframe');
        if(empty($element)) {
            throw new Exception('Could not see the payco iframe');
        }
    }

    /**
     * @Then /^I log out of prestashop store/
     */
    public function iLogOutOfPrestaShopStore()
    {
        $element = $this->getSession()->getPage()->find('css', '.logout');
        if(!empty($element)) {
            $this->getSession()->getPage()->clickLink('Log me out');
        }
    }

    /**
     * @Then /^I select paypal/
     * @throws \Behat\Mink\Exception\ElementNotFoundException
     */
    public function iSelectPaypal()
    {
        $this->getSession()->wait(9000);
        $this->getSession()->getPage()->find('css','input[value="PAYPAL"]')->click();
    }

    /**
     * @Then /^I cancel paypal/
     * @throws \Behat\Mink\Exception\ElementNotFoundException
     */
    public function iCancelPaypalOrder()
    {
        //cancel_return
        $this->getSession()->getPage()->find('css','#cancel_return')->click();
    }

    /**
     * @Then /^I provide an card/
     * @throws \Behat\Mink\Exception\ElementNotFoundException
     */
    public function iProvideAnCreditCard()
    {
        $this->getSession()->wait(9000);
        $yearForCard = date("Y");
        $yearForCard++; //Increment the current year so test will not need modification

        $this->getSession()->getPage()->find('css','input[value="CC"]')->click();
        $this->getSession()->getPage()->fillField('CC-add-payment-instrument-number', '4548812049400004');
        $this->getSession()->getPage()->fillField('CC-add-payment-instrument-cvv',285);
        $this->getSession()->getPage()->fillField('CC-add-payment-instrument-accountHolder', $this->name);

        $this->getSession()->getPage()->selectFieldOption('CC-add-payment-instrument-expirationMonth', 12);
        $this->getSession()->getPage()->selectFieldOption('CC-add-payment-instrument-expirationYear', $yearForCard);

        $this->getSession()->getPage()->selectFieldOption('CC-add-payment-instrument-issuer', 'VISA');
    }

    /**
     * @Then /^I get the order reference/
     */
    public function iGetTheOrderReference()
    {
        $page = $this->getSession()->getPage()->getHtml();
        $match = array();
        if(!preg_match('/Your\sorder\sreference\sis\s([A-Z0-9]*)\./',$page, $match)) {
            throw new Exception('Could not found find an order reference');
        }else{
            $this->orderReference = $match[1];
        }
    }

    /**
     * @Then /^I goto saved order in admin/
     */
    public function iGotoSavedOrderInAdmin()
    {
        $this->prestashopAdminContext->iGoToOrderInAdmin($this->orderReference);
    }

    /**
     * @Then /^(?:|I )perform an capture of "(?P<text>(?:[^"]|\\")*)"$/
     */
    public function performAnCapture($amount)
    {
        $this->getSession()->getPage()->find('css', '#formAddPayment input[name="payment_method"]')->setValue('Payco Module');
        $this->getSession()->getPage()->find('css','#formAddPayment input[name="payment_amount"]')->setValue($amount);
        $this->getSession()->getPage()->find('css','#formAddPayment button[name="submitAddPayment"]')->press();
    }

    /**
     * @Then /^(?:|I )fill in an refund of "(?P<text>(?:[^"]|\\")*)"$/
     */
    public function iFillInAnRefundOf($amount)
    {
        $options = $this->getSession()->getPage()->findAll('css', '#formPaycoRefund tr datalist[id="capture_id"] option');
        $option = current($options);

        $captureId = $option->getAttribute('value');

        $this->getSession()->getPage()->find('css','#formPaycoRefund input[name="capture_id"]')->setValue($captureId);
        $this->getSession()->getPage()->fillField('refund_description', 'A test refund from behat');
        $this->getSession()->getPage()->find('css','#formPaycoRefund input[name="amount"]')->setValue($amount);
        $this->getSession()->getPage()->find('css','#formPaycoRefund button[name="submitPaycoRefund"]')->press();
    }

    /**
     * @Then /^I should see an refund/
     */
    public function iShouldSeeAnRefund()
    {
        $element = $this->getSession()->getPage()->find('css','#formPaycoRefund table tbody');
        if(!$element) {
            throw new Exception('could not find the refund table');
        }

        $rows = $this->getSession()->getPage()->findAll('css','#formPaycoRefund table tbody tr');

        if(count($rows) < 2) {
            //there should be at lest two rows if a single refund is done
            throw new Exception('could not see an refund');
        }

    }

    /**
     * @Then /^I should see an Payco Order Reference/
     */
    public function iShouldSeeAnPaycoOrderReference()
    {
        $rows = $this->getSession()->getPage()->findAll('css','dd[data-payco-transaction-ref="1"]');
        if(count($rows) != 1) {
            throw new Exception('could not see an transaction reference');
        }
    }

}