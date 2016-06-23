<?php


class HostedpaymentsErrorModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        global $smarty;

        $this->ssl = true;
        $this->display_column_left = false;
        $this->display_column_right = false;

        parent::initContent();


        $this->context->smarty->assign(array(
            'this_path' => $this->module->getPathUri(),
            'this_path_upg' => $this->module->getPathUri(),
            'this_path_ssl' => Tools::getShopDomainSsl(true, true).__PS_BASE_URI__.'modules/'.$this->module->name.'/',
        ));

        $this->setTemplate('processError.tpl');

        return true;
    }
}