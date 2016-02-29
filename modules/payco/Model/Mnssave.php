<?php

include_once(_PS_MODULE_DIR_ . 'payco/vendor/autoload.php');

class MnsSave implements \Upg\Library\Mns\ProcessorInterface
{

    private $merchantID;
    private $storeID;
    private $orderID;
    private $captureID;
    private $merchantReference;
    private $paymentReference;
    private $userID;
    private $amount;
    private $currency;
    private $transactionStatus;
    private $orderStatus;
    private $additionalData;
    private $timestamp;
    private $version;

    private $module;

    public function __construct(Payco $module)
    {
        $this->module = $module;
    }

    /**
     * @param $merchantID This is the merchantID assigned by PayCo.
     * @param $storeID This is the store ID of a merchant assigned by PayCo as a merchant can have more than one store.
     * @param $orderID This is the order number tyhat the shop has assigned
     * @param $captureID The confirmation ID of the capture. Only sent for Notifications that belong to captures
     * @param $merchantReference Reference that can be set by the merchant during the createTransaction call.
     * @param $paymentReference The reference number of the
     * @param $userID The unique user id of the customer.
     * @param $amount This is either the amount of an incoming payment or “0” in case of some status changes
     * @param $currency  Currency code according to ISO4217.
     * @param $transactionStatus Current status of the transaction. Same values as resultCode
     * @param $orderStatus Possible values: PAID PAYPENDING PAYMENTFAILED CHARGEBACK CLEARED. Status of order
     * @param $additionalData Json string with aditional data
     * @param $timestamp Unix timestamp, Notification timestamp
     * @param $version notification version (currently 1.5)
     * @link http://www.manula.com/manuals/payco/payment-api/hostedpagesdraft/en/topic/notification-call
     */
    public function sendData(
        $merchantID,
        $storeID,
        $orderID,
        $captureID,
        $merchantReference,
        $paymentReference,
        $userID,
        $amount,
        $currency,
        $transactionStatus,
        $orderStatus,
        $additionalData,
        $timestamp,
        $version
    ) {
        $this->merchantID = $merchantID;
        $this->storeID = $storeID;
        $this->orderID = $orderID;
        $this->captureID = $captureID;
        $this->merchantReference = $merchantReference;
        $this->paymentReference = $paymentReference;
        $this->userID = $userID;
        $this->amount = $amount;
        $this->currency = $currency;
        $this->transactionStatus = $transactionStatus;
        $this->orderStatus = $orderStatus;
        $this->additionalData = $additionalData;
        $this->timestamp = $timestamp;
        $this->version = $version;
    }

    /**
     * The run method used by the processor to run successfuly validated MNS notifications.
     * This should not return anything
     */
    public function run()
    {
        $mappedOrderId = $this->module->getOrderRefFromTransactionId($this->orderID);
        $queryData = array(
            'merchantID' => psql($this->merchantID),
            'storeID' => psql($this->storeID),
            'orderID' => $mappedOrderId,
            'captureID' => psql($this->captureID),
            'merchantReference' => psql($this->merchantReference),
            'paymentReference' => psql($this->paymentReference),
            'userID' => psql($this->userID),
            'amount' => psql($this->amount),
            'currency' => psql($this->currency),
            'transactionStatus' => psql($this->transactionStatus),
            'orderStatus' => psql($this->orderStatus),
            'additionalData' => psql($this->additionalData),
            'mns_timestamp' => psql($this->timestamp),
            'version' => psql($this->version),
        );


        Db::getInstance()->insert('upg_mns_messages', $queryData);
    }
}

