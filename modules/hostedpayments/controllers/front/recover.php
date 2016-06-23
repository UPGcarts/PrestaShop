<?php

include_once(_PS_MODULE_DIR_ . 'hostedpayments/vendor/autoload.php');
include_once(_PS_MODULE_DIR_ . 'hostedpayments/Model/callback.php');

/**
 * @property Hostedpayments module
 * Class UpgRecoverModuleFrontController
 */
class HostedpaymentsRecoverModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        global $smarty;

        $this->ssl = true;
        $this->display_column_left = false;
        $this->display_column_right = false;

        parent::initContent();

        if(UpgPrestashopCallback::validateCallbackUrl($_GET['url'])) {
            $this->context->smarty->assign(array(
                'nbProducts' => $this->context->cart->nbProducts(),
                'this_path' => $this->module->getPathUri(),
                'this_path_upg' => $this->module->getPathUri(),
                'this_path_ssl' => Tools::getShopDomainSsl(true,
                        true) . __PS_BASE_URI__ . 'modules/' . $this->module->name . '/',
                'iframe_url' => $_GET['url']
            ));

            $this->setTemplate('process.tpl');

        }else{
            $this->context->smarty->assign(array(
                'this_path' => $this->module->getPathUri(),
                'this_path_upg' => $this->module->getPathUri(),
                'this_path_ssl' => Tools::getShopDomainSsl(true, true).__PS_BASE_URI__.'modules/'.$this->module->name.'/',
            ));

            $this->setTemplate('processError.tpl');
        }

        return true;
    }
}