<!-- Payco refund -->
<div id="formPaycoRefund" class="panel">
    <div class="panel-heading">
        <i class="icon-money"></i>
        {l s="UPG Refund"} <span class="badge"></span>
    </div>
    <form id="formPaycoRefund"  method="post" action="{$current_index}&amp;vieworder&amp;id_order={$order->id}&amp;token={$smarty.get.token|escape:'html':'UTF-8'}">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th><span class="title_box ">{l s='Capture Transaction ID'}</span></th>
                    <th><span class="title_box ">{l s='Refund Description'}</span></th>
                    <th><span class="title_box ">{l s='Amount'}</span></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                    {foreach from=$refunds item=refund}
                        <tr>
                            <td>{$refund['transaction_id']|escape:'html':'UTF-8'}</td>
                            <td>{$refund['refund_description']|escape:'html':'UTF-8'}</td>
                            <td>{$refund['amount']|escape:'html':'UTF-8'}</td>
                            <td></td>
                        </tr>
                    {/foreach}
                    {if $captures}
                    <tr class="current-edit hidden-print">
                        <td>
                            <input name="capture_id" autocomplete="off" list="capture_id" class="capture_id">
                            <datalist id="capture_id">
                                {foreach from=$captures item=capture}
                                    {if $capture->payment_method == 'Upg Module'}
                                    <option value="{$capture->id}">{$capture->amount} : {$capture->transaction_id}</option>
                                    {/if}
                                {/foreach}
                            </datalist>
                        </td>
                        <td>
                            <input type="text" name="refund_description" autocomplete="off" value="" maxlength="255" class="form-control fixed-width-sm"/>
                        </td>
                        <td>
                            <input type="text" name="amount" autocomplete="off" value="" class="form-control fixed-width-sm"/>
                        </td>
                        <td class="actions">
                            <button class="btn btn-primary" type="submit" name="submitPaycoRefund">
                                {l s='Refund'}
                            </button>
                        </td>
                    </tr>
                    {/if}
                </tbody>
            </table>
        </div>
    </form>
    {if (!$order->valid)}
    {/if}
</div>
