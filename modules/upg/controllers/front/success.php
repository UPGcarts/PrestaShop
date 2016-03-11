<?php


class UpgSuccessModuleFrontController extends ModuleFrontController
{
    public function postProcess()
    {
        $this->context->cart = new Cart();
        $upg = Module::getInstanceByName('upg');
        $orderId = intval($_GET['order_id']);
        $cartId = intval($_GET['cart_id']);
        $cart = new Cart($cartId);

        $customer = new Customer($cart->id_customer);

        Tools::redirect('index.php?controller=order-confirmation&id_cart='.$cartId.'&id_module='.$upg->id.'&id_order='.$orderId.'&key='.$customer->secure_key);
    }
}