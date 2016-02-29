<?php

include_once(_PS_MODULE_DIR_ . 'payco/vendor/autoload.php');
include_once(_PS_MODULE_DIR_ . 'payco/Model/callback.php');

/**
 * @property Payco module
 * Class PaycoCallbackModuleFrontController
 */
class PaycoCallbackModuleFrontController extends ModuleFrontController
{

    public function postProcess()
    {
        $config = $this->module->getConfig();

        $data = array(
            'notificationType' => (array_key_exists('notificationType',$_GET)?$_GET['notificationType']:''),
            'merchantID' => (array_key_exists('merchantID',$_GET)?$_GET['merchantID']:''),
            'storeID' => (array_key_exists('storeID',$_GET)?$_GET['storeID']:''),
            'orderID' => (array_key_exists('orderID',$_GET)?$_GET['orderID']:''),
            'paymentMethod' => (array_key_exists('paymentMethod',$_GET)?$_GET['paymentMethod']:''),
            'resultCode' => (array_key_exists('resultCode',$_GET)?$_GET['resultCode']:''),
            'merchantReference' => (array_key_exists('merchantReference',$_GET)?$_GET['merchantReference']:''),
            'additionalInformation' => (array_key_exists('additionalInformation',$_GET)?$_GET['additionalInformation']:''),
            'paymentInstrumentsPageUrl' => (array_key_exists('paymentInstrumentsPageUrl',$_GET)?$_GET['paymentInstrumentsPageUrl']:''),
            'paymentInstrumentID' => (array_key_exists('paymentInstrumentID',$_GET)?$_GET['paymentInstrumentID']:''),
            'message' => (array_key_exists('message',$_GET)?$_GET['message']:''),
            'salt' => (array_key_exists('salt',$_GET)?$_GET['salt']:''),
            'mac' => (array_key_exists('mac',$_GET)?$_GET['mac']:''),
        );

        $processor = new PaycoPrestashopCallback($this->module, $config);

        try {
            $handler = new \Upg\Library\Callback\Handler($config, $data, $processor);
            echo $result = $handler->run();
        }catch (\Upg\Library\Callback\Exception\MacValidation $e) {
            Logger::addLog(
                'Hmac validation failed'.' '.$data['orderID'].' '.$e->getMessage(),
                1,
                null,
                null,
                null, true
            );

            echo json_encode(array('url'=>Context::getContext()->link->getModuleLink('payco', 'error')));

        }catch (Exception $e) {
            Logger::addLog(
                'Critical error'.' '.$data['orderID'].' '.$e->getMessage(),
                1,
                null,
                null,
                null, true
            );

            echo json_encode(array('url'=>Context::getContext()->link->getModuleLink('payco', 'error')));
        }

        exit;
    }

}