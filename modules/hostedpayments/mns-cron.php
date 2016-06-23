<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$moduleDirectory = dirname(__FILE__);
//$moduleDirectory = '/opt/Projects/prestashop/modules/blocksocial';

include($moduleDirectory.'/../../config/config.inc.php');
include($moduleDirectory.'/../../init.php');

include_once(_PS_MODULE_DIR_ . 'hostedpayments/Model/MnsProcess.php');

$sql = "SELECT *
        FROM "._DB_PREFIX_."upg_mns_messages
        WHERE mns_processed = 0
        AND mns_error_processing = 0
        ORDER BY mns_timestamp ASC";

if ($results = Db::getInstance()->ExecuteS($sql)) {
    foreach ($results as $mns) {

        $checkSql = 'SELECT id_order FROM '._DB_PREFIX_.'orders WHERE reference = "'.pSQL($mns['orderID']).'"';
        $orderId = Db::getInstance()->getValue($checkSql);

        $mnsOrderStatus = trim(strtoupper($mns['orderStatus']));
        $mnsTransactionStatus = trim(strtoupper($mns['transactionStatus']));

        if($orderId) {
            /**
             * @var OrderCore $core
             */
            $order = new Order($orderId);
            $processed = false;
            $orderStatusProcess = false;

            if(!empty($mnsTransactionStatus)) {
                //do the transaction status
                switch($mnsTransactionStatus) {
                    case 'CANCELLED':
                    case 'FRAUDCANCELLED':
                    case 'EXPIRED':
                        MnsProcess::cancel($order, $mns);
                        $processed = true;
                        break;
                    case 'NEW':
                        $processed = true;
                    case 'ACKNOWLEDGEPENDING':
                        MnsProcess::transactionStatusAcknowledgePending($order, $mns);
                        $processed = true;
                        break;
                    case 'FRAUDPENDING':
                        MnsProcess::transactionStatusFraudPending($order, $mns);
                        $processed = true;
                        break;
                    case 'CIAPENDING':
                        MnsProcess::transactionStatusCiaPending($order, $mns);
                        break;
                    case 'MERCHANTPENDING':
                        MnsProcess::transactionStatusMerchantPending($order, $mns);
                        $processed = true;
                        break;
                    case 'INPROGRESS':
                        MnsProcess::transactionStatusInProgress($order, $mns);
                        $orderStatusProcess = true;
                        $processed = true;
                        break;
                    case 'DONE':
                        MnsProcess::transactionStatusDone($order, $mns);
                        $orderStatusProcess = true;
                        $processed = true;
                        break;
                    default:
                        $processed = false;
                        break;
                }
            }

            if(!empty($mnsOrderStatus) && ($orderStatusProcess || !$processed)) {
                switch ($mnsOrderStatus) {
                    case 'PAID':
                        MnsProcess::paid($order, $mns);
                        $processed = true;
                        break;
                    case 'PAYPENDING':
                        MnsProcess::payPending($order, $mns);
                        $processed = true;
                        break;
                    case 'PAYMENTFAILED':
                        MnsProcess::paymentFailed($order, $mns);
                        $processed = true;
                        break;
                    case 'CHARGEBACK':
                        MnsProcess::chargeBack($order, $mns);
                        $processed = true;
                        break;
                    case 'CLEARED':
                        MnsProcess::cleared($order, $mns);
                        $processed = true;
                        break;
                    case 'CPM_MANAGED':
                    case 'INDUNNING':
                        MnsProcess::InDunning($order, $mns);
                        break;
                    default:
                        $processed = false;
                        break;
                }
            }

            if(!$processed) {
                Logger::addLog(
                    'Hosted Payment - MNS can no valid order state or transaction status was sent'.
                    "order ref: {$mns['orderID']}, transactionStatus: {$mns['transactionStatus']} orderStatus: {$mns['orderStatus']}",
                    1,
                    null,
                    null,
                    null, true
                );

                Db::getInstance()->update('upg_mns_messages', array('mns_error_processing' => 1), 'id_mns = '.$mns['id_mns']);
            }else{
                Db::getInstance()->update('upg_mns_messages', array('mns_processed' => 1),
                    'id_mns = ' . $mns['id_mns']);
            }
        }else{
            Logger::addLog(
                'Hosted Payment - MNS can not be processed as order can not be found'.' '.$mns['orderID'].' ',
                1,
                null,
                null,
                null, true
            );

            Db::getInstance()->update('upg_mns_messages', array('mns_error_processing' => 1), 'id_mns = '.$mns['id_mns']);
        }
    }
}