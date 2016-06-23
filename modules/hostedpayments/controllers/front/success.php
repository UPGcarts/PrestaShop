<?php


class HostedpaymentsSuccessModuleFrontController extends ModuleFrontController
{
    public function postProcess()
    {
        $context = Context::getContext();
        $cart = $context->cart;

        $upg = Module::getInstanceByName('hostedpayments');
        //$orderId = intval($_GET['order_id']);
        $cartId = intval($_GET['cart_id']);
        $transactionId = $_GET['transaction_id'];
        $cart = new Cart($cartId);

        $customer = new Customer($cart->id_customer);
        $orderId = $upg->convertCartToOrder($cartId, $transactionId);

        Db::getInstance()->update(
            'upg_transaction',
            array('id_order'=> $orderId),
            'transaction_reference = "'.pSQL($transactionId).'"'
        );

        $context = Context::getContext();
        $context->cart->update();
        $context->cart = new Cart();

        Tools::redirect('index.php?controller=order-confirmation&id_cart='.$cartId.'&id_module='.$upg->id.'&id_order='.$orderId.'&key='.$customer->secure_key);
    }
}