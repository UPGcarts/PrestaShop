{if $show}
<div id="formUpgRefund" class="panel">
    <div class="panel-heading">
        <i class="icon-money"></i>
        {l s="API Action"} <span class="badge"></span>
    </div>
    <form id="apiAction"  method="post" action="{$current_index}&amp;vieworder&amp;id_order={$order->id}&amp;token={$smarty.get.token|escape:'html':'UTF-8'}">
        <td class="actions">
            {if $canFinish}
            <button class="btn btn-primary" type="submit" name="submitApiActionFinish" value="1">
                {l s='Finish'}
            </button>
            {/if}
            {if $canCancel}
                <button class="btn btn-primary" type="submit" name="submitApiActionCancel" value="1">
                    {l s='Cancel'}
                </button>
            {/if}
        </td>
    </form>
</div>
{/if}