<?php


class HostedpaymentsProcessModuleFrontController extends ModuleFrontController
{

    private $b2bFields = array();

    public function postProcess()
    {
        //ok save the b2b fields against the customer
        if (Tools::isSubmit('UPG_BUSINESS'))
        {
            $userId = (int)$this->context->cart->id_customer;
            $companyRegistrationID = $this->getValue('companyRegistrationID', 30);
            $companyVatID = $this->getValue('companyVatID', 30);
            $companyTaxID = $this->getValue('companyTaxID', 30);
            $companyRegisterType = Db::getInstance()->escape(Tools::getValue('companyRegisterType'));

            $queryData = array(
                'id_customer' => $userId,
                'companyRegistrationID' => $companyRegistrationID,
                'companyVatID' => $companyVatID,
                'companyTaxID' => $companyTaxID,
                'companyRegisterType' => $companyRegisterType,
            );

            $this->b2bFields = array(
                'companyRegistrationID' => $this->getValueForCall('companyRegistrationID', 30),
                'companyVatID' => $this->getValueForCall('companyVatID', 30),
                'companyTaxID' => $this->getValueForCall('companyTaxID', 30),
                'companyRegisterType' => Tools::getValue('companyRegisterType')
            );

            //check if insert or update is needed
            $checkSql = 'SELECT id_customer FROM '._DB_PREFIX_.'upg_business_fields WHERE id_customer = '.$userId;
            if ($row = Db::getInstance()->getRow($checkSql)){
                //do update
                Db::getInstance()->update('upg_business_fields', $queryData, 'id_customer = '.$userId);
            } else {
                //do insert
                Db::getInstance()->insert('upg_business_fields', $queryData);
            }

        }
    }

    public function initContent()
    {
        global $smarty;

        $this->ssl = true;
        $this->display_column_left = false;
        $this->display_column_right = false;

        parent::initContent();


        try {
            //$this->context->cart = $this->module->checkCartHasBeenUsed($this->context->cart);
            $iframeUrl = $this->module->populateOrder($this->context->cart, $this->b2bFields);

            $this->context->smarty->assign(array(
                'nbProducts' => $this->context->cart->nbProducts(),
                'this_path' => $this->module->getPathUri(),
                'this_path_upg' => $this->module->getPathUri(),
                'this_path_ssl' => Tools::getShopDomainSsl(true,
                        true) . __PS_BASE_URI__ . 'modules/' . $this->module->name . '/',
                'iframe_url' => $iframeUrl
            ));

            $this->setTemplate('process.tpl');
        }catch (Exception $e) {

            $this->context->smarty->assign(array(
                'this_path' => $this->module->getPathUri(),
                'this_path_upg' => $this->module->getPathUri(),
                'this_path_ssl' => Tools::getShopDomainSsl(true,
                        true) . __PS_BASE_URI__ . 'modules/' . $this->module->name . '/',
            ));

            $this->setTemplate('processError.tpl');
        }
    }

    private function getValue($key, $length)
    {
        $value = trim(Tools::getValue($key));
        $value = substr($value,0, $length);
        return Db::getInstance()->escape($value);
    }

    private function getValueForCall($key, $length)
    {
        $value = trim(Tools::getValue($key));
        return substr($value,0, $length);
    }


}