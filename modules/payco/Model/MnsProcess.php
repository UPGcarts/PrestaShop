<?php

class MnsProcess
{

    public static function cancel(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PS_OS_CANCELED');

        self::changeOrderStatus($order, $orderStatus);
        return true;
    }


    public static function transactionStatusAcknowledgePending(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PAYCO_MNS_TRANSACTION_STATUS_ACKNOWLEDGEPENDING');
        self::changeOrderStatus($order, $orderStatus);
        return true;
    }

    public static function transactionStatusFraudPending(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PAYCO_MNS_TRANSACTION_STATUS_FRAUDPENDING');
        self::changeOrderStatus($order, $orderStatus);
        return true;
    }

    public static function transactionStatusCiaPending(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PAYCO_MNS_TRANSACTION_STATUS_CIAPENDING');
        self::changeOrderStatus($order, $orderStatus);
        return true;
    }

    public static function transactionStatusMerchantPending(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PAYCO_MNS_TRANSACTION_STATUS_MERCHANTPENDING');
        self::changeOrderStatus($order, $orderStatus);
        return true;
    }

    public static function transactionStatusInProgress(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PAYCO_MNS_TRANSACTION_STATUS_INPROGRESS');
        self::changeOrderStatus($order, $orderStatus);
        return true;
    }

    public static function transactionStatusDone(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PAYCO_MNS_TRANSACTION_STATUS_INPROGRESS');
        self::changeOrderStatus($order, $orderStatus);
        return true;
    }

    public static function paid(OrderCore $order, array $mns)
    {
        //check if order was autocapture
        $autocaptureSql = "SELECT autocapture, paymentMethod FROM "._DB_PREFIX_."upg_transaction WHERE id_order = ".$order->id;
        $autocaptureFlag = Db::getInstance()->getRow($autocaptureSql);

        $orderStatus = Configuration::get('PAYCO_RESERVE_PAID');

        if($autocaptureFlag['autocapture'] && self::canPaymentBeAutocaptured($autocaptureFlag['paymentMethod'])) {

            $checkSql = "SELECT COUNT(id_order_payment) payments_numbers FROM "._DB_PREFIX_."order_payment WHERE order_reference = '".$order->reference."'";

            $previousPaymentCount = Db::getInstance()->getValue($checkSql);

            if($previousPaymentCount > 0) {
                $amendSql = 'UPDATE '._DB_PREFIX_.'order_payment SET amount=0.00 WHERE order_reference = "'.$order->reference.'"';
                Db::getInstance()->execute($amendSql);
            }

            $queryData = array(
                'order_reference' => $order->reference,
                'id_currency' => $order->id_currency,
                'amount' => $order->total_paid,
                'payment_method' => 'Payco Module',
                'conversion_rate' => $order->conversion_rate,
                'transaction_id' => $order->reference,
                'date_add' => date('Y-m-d H:i:s')
            );

            Db::getInstance()->insert('order_payment', $queryData);

            $orderStatus = Configuration::get('PAYCO_AUTOCAPTURE_PAID');

        }

        self::changeOrderStatus($order, $orderStatus);

        return true;
    }

    public static function payPending(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PAYCO_RESERVE_PAIDPENDING');

        self::changeOrderStatus($order, $orderStatus);

        return true;

    }

    public static function paymentFailed(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PAYCO_MNS_PAYMENTFAILED');

        self::changeOrderStatus($order, $orderStatus);

        return true;
    }

    public static function chargeBack(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PAYCO_MNS_CHARGEBACK');

        self::changeOrderStatus($order, $orderStatus);

        return true;
    }

    public static function cleared(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PAYCO_MNS_CLEARED');

        self::changeOrderStatus($order, $orderStatus);

        return true;
    }

    public static function InDunning(OrderCore $order, array $mns)
    {
        $orderStatus = Configuration::get('PAYCO_MNS_INDUNNING');
        self::changeOrderStatus($order, $orderStatus);

        return true;
    }

    private static function changeOrderStatus(OrderCore $order, $statusId)
    {
        $history = new OrderHistory();
        $history->id_order = (int)$order->id;
        $history->changeIdOrderState($statusId, $order->id, true);

        return true;
    }

    private static function canPaymentBeAutocaptured($method)
    {
        $method = trim($method);
        switch($method) {
            case 'DD':
            case 'BILL':
            case 'BILL_SECURE':
                return false;
                break;
        }

        return true;
    }

}
