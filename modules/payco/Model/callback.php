<?php

include_once(_PS_MODULE_DIR_ . 'payco/vendor/autoload.php');

class PaycoPrestashopCallback implements \Upg\Library\Callback\ProcessorInterface
{

    const NOTIFICATION_TYPE_PAYMENT_STATUS= 'PAYMENT_STATUS';

    private $notificationType;
    private $merchantID;
    private $storeID;
    private $orderID;
    private $paymentMethod;
    private $resultCode;
    private $merchantReference;
    private $paymentInstrumentID;
    private $paymentInstrumentsPageUrl;
    private $additionalInformation = array();
    private $message;

    private $module;
    private $config;

    public function __construct(Payco $module, \Upg\Library\Config $config)
    {
        $this->module = $module;
        $this->config = $config;
    }

    /**
     * Send data to the processor that will be used in the run method
     * Unless specified most parameters will not be blank
     *
     * @param $notificationType This is the notification type which can be PAYMENT_STATUS, PAYMENT_INSTRUMENT_SELECTION
     * @param $merchantID This is the merchantID assigned by PayCo.
     * @param $storeID This is the store ID of a merchant assigned by PayCo as a merchant can have more than one store.
     * @param $orderID This is the order number of the shop.
     * @param $paymentMethod This is the selected payment method
     * @param $resultCode 0 means OK, any other code means error
     * @param $merchantReference Reference that was set by the merchant during the createTransaction call. Optional
     * @param $paymentInstrumentID This is the payment instrument Id that was used
     * @param $paymentInstrumentsPageUrl This is the payment instruments page url.
     * Which may or may not be given depending on user flow and integration mode
     * @param array $additionalInformation Optional additional info in an associative array
     * @param $message Details about an error, otherwise not present. Optional
     */
    public function sendData(
        $notificationType,
        $merchantID,
        $storeID,
        $orderID,
        $paymentMethod,
        $resultCode,
        $merchantReference,
        $paymentInstrumentID,
        $paymentInstrumentsPageUrl,
        array $additionalInformation,
        $message
    )
    {
        $this->notificationType = $notificationType;
        $this->merchantID = $merchantID;
        $this->storeID = $storeID;
        $this->orderID = $orderID;
        $this->paymentMethod = $paymentMethod;
        $this->resultCode = $resultCode;
        $this->merchantReference = $merchantReference;
        $this->paymentInstrumentID = $paymentInstrumentID;
        $this->paymentInstrumentsPageUrl = trim($paymentInstrumentsPageUrl);
        $this->additionalInformation = $additionalInformation;
        $this->message = $message;
    }

    public function run()
    {
        if($this->notificationType == self::NOTIFICATION_TYPE_PAYMENT_STATUS && $this->resultCode == 0) {
            $checkSql = 'SELECT transaction_reference FROM '._DB_PREFIX_.'upg_transaction WHERE transaction_reference = "'.pSQL($this->orderID).'"';
            $transactionId = Db::getInstance()->getValue($checkSql);


            if($transactionId){
                $orderStatus = Configuration::get(Payco::UPG_STATUS_RETURNED);

                list($cartId, $timestamp) = explode(':', $transactionId);

                $orderId = $this->module->convertCartToOrder($cartId, $transactionId);

                Db::getInstance()->update(
                    'upg_transaction',
                    array('paymentMethod' => pSQL($this->paymentMethod), 'id_order'=> $orderId),
                    'transaction_reference = '.(int)$transactionId
                );

                return Context::getContext()->link->getModuleLink('payco', 'success', array('order_id'=>$orderId, 'cart_id'=>$cartId));
            }

        }

        //check for the paypal field
        if(self::validateCallbackUrl($this->paymentInstrumentsPageUrl)) {
            return Context::getContext()->link->getModuleLink('payco', 'recover', array('url'=>$this->paymentInstrumentsPageUrl), true);
        }

        return Context::getContext()->link->getModuleLink('payco', 'error');
    }

    public static function validateCallbackUrl($url)
    {
        if(empty($url)){
            return false;
        }

        if (filter_var($url, FILTER_VALIDATE_URL) === FALSE) {
            return false;
        }

        $parsedUrl = parse_url($url);

        return in_array($parsedUrl['scheme'], array('http','https'));
    }
}