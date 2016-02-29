<?php


class PaycoPaymentModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        global $smarty;

        $this->ssl = true;
        $this->display_column_left = false;
        $this->display_column_right = false;

        parent::initContent();

        $cart = $this->context->cart;
        $invoiceAddress = new AddressCore((int)$cart->id_address_invoice);

        if (!empty($invoiceAddress->company) && Configuration::get('PAYCO_B2B_ENABLED')) {
            //do the b2b order
            $this->context->smarty->assign(array(
                'nbProducts' => $cart->nbProducts(),
                'this_path' => $this->module->getPathUri(),
                'this_path_payco' => $this->module->getPathUri(),
                'this_path_ssl' => Tools::getShopDomainSsl(true, true).__PS_BASE_URI__.'modules/'.$this->module->name.'/',
                'payco_company_types' => $this->module->getCompanyRegisterTypeOptions()
            ));

            $this->setTemplate('paymentb2b.tpl');

        } else {
            //this is a normal transaction do redirect
            Tools::redirect($this->context->link->getModuleLink('payco', 'process'));
        }

        return true;
    }
}