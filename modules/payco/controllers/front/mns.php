<?php

include_once(_PS_MODULE_DIR_ . 'payco/vendor/autoload.php');
include_once(_PS_MODULE_DIR_ . 'payco/Model/Mnssave.php');

/**
 * @property Payco module
 * Class PaycoCallbackModuleFrontController
 */
class PaycoMnsModuleFrontController extends ModuleFrontController
{
    /**
     * @var Payco $this->module
     */
    public function postProcess()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            header('HTTP/1.1 400 Bad Request');
            exit;
        }

        $data = array(
            'merchantID' => (array_key_exists('merchantID',$_POST)?$_POST['merchantID']:''),
            'storeID' => (array_key_exists('storeID',$_POST)?$_POST['storeID']:''),
            'orderID' => (array_key_exists('orderID',$_POST)?$_POST['orderID']:''),
            'captureID' => (array_key_exists('captureID',$_POST)?$_POST['captureID']:''),
            'merchantReference' => (array_key_exists('merchantReference',$_POST)?$_POST['merchantReference']:''),
            'paymentReference' => (array_key_exists('paymentReference',$_POST)?$_POST['paymentReference']:''),
            'userID' => (array_key_exists('userID',$_POST)?$_POST['userID']:''),
            'amount' => (array_key_exists('amount',$_POST)?$_POST['amount']:''),
            'currency' => (array_key_exists('currency',$_POST)?$_POST['currency']:''),
            'transactionStatus' => (array_key_exists('transactionStatus',$_POST)?$_POST['transactionStatus']:''),
            'orderStatus' => (array_key_exists('orderStatus',$_POST)?$_POST['orderStatus']:''),
            'additionalData' => (array_key_exists('additionalData',$_POST)?$_POST['additionalData']:''),
            'timestamp' => (array_key_exists('timestamp',$_POST)?$_POST['timestamp']:''),
            'version' => (array_key_exists('version',$_POST)?$_POST['version']:''),
            'mac' => (array_key_exists('mac',$_POST)?$_POST['mac']:''),
        );

        $processor = new MnsSave($this->module);

        $checkSql = 'SELECT id_order FROM '._DB_PREFIX_.'upg_transaction WHERE transaction_reference = "'.pSQL($data['orderID']).'"';
        $orderId = Db::getInstance()->getValue($checkSql);

        if(empty($orderId)) {
            Logger::addLog(
                $this->l('MNS issue: transaction could not be found for').' '.$data['orderID'],
                1,
                null,
                null,
                null, true
            );

            header("HTTP/1.1 200 OK");
            exit;
        }

        try {
            $order = new Order($orderId);
            $currency = Currency::getCurrency($order->id_currency);
            $config = $this->module->getConfig($currency['iso_code']);

            $handler = new \Upg\Library\Mns\Handler($config, $data, $processor);
            $handler->run();
            header("HTTP/1.1 200 OK");
            exit;
        }catch (Exception $e) {
            Logger::addLog(
                $this->l('Got mns error').' '.$data['orderID'].' '.$e->getMessage(),
                1,
                null,
                null,
                null, true
            );
            header("HTTP/1.1 200 OK");
            exit;
        }
        exit;
    }
}