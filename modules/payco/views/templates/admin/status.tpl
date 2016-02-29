<!-- Payco status -->
<div class="panel">
    <div class="panel-heading">
        <i class="icon-money"></i>
        {l s="Payco Payment Status"} <span class="badge"></span>
    </div>
    <div id="payco_status" class="well hidden-print">
        <dl>
            <dt>Transaction Reference</dt>
            <dd data-payco-transaction-ref="1">{$transactionId|escape:'html':'UTF-8'}</dd>
            <dt>Transaction Status</dt>
            <dd>{$transactionStatus|escape:'html':'UTF-8'}</dd>
            {foreach from=$additionalData key=label item=value}
                <dt>{$label|escape:'html':'UTF-8'}</dt>
                <dd>{$value|escape:'html':'UTF-8'}</dd>
            {/foreach}
        </dl>
    </div>
</div>