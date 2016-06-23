{capture name=path}
    <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}" title="{l s='Go back to the Checkout' mod='hostedpayments'}">{l s='Checkout' mod='hostedpayments'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Hosted payment' mod='hostedpayments'}
{/capture}

<h2>{l s='Payment' mod='hostedpayments'}</h2>
{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}
<span style="margin: 0; padding: 0px 0px 10px 0px; display: inline-block;"></span>
{if $nbProducts <= 0}
    <p class="warning">{l s='Your shopping cart is empty.' mod='hostedpayments'}</p>
{else}
    <iframe id="upg_iframe" name="upg_iframe" width="100%" height="1500px" src="{$iframe_url}" />
{/if}