{capture name=path}
    <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}" title="{l s='Go back to the Checkout' mod='payco'}">{l s='Checkout' mod='payco'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Payco payment' mod='payco'}
{/capture}

<h2>{l s='Payment' mod='payco'}</h2>

<form action="{$link->getModuleLink('payco', 'process', [], true)|escape:'html'}" method="post">
    {assign var='current_step' value='payment'}
    {include file="$tpl_dir./order-steps.tpl"}
    <span style="margin: 0; padding: 0px 0px 10px 0px; display: inline-block;"></span>
    {if $nbProducts <= 0}
        <p class="warning">{l s='Your shopping cart is empty.' mod='payco'}</p>
    {else}
        <p>
            <input type="hidden" name="UPG_BUSINESS" value="1">
            <label>{l s='Company Registration ID' mod='payco'}</label>
            <input type="text" name="companyRegistrationID" />
            <br /><br />
            <label>{l s='Company VAT ID' mod='payco'}</label>
            <input type="text" name="companyVatID" />
            <br /><br />
            <label>{l s='Company Tax ID' mod='payco'}</label>
            <input type="text" name="companyTaxID" />
            <br /><br />
            <label>{l s='Company Registration Type' mod='payco'}</label>
            <select id="companyRegisterType" name="companyRegisterType">
                {foreach from=$payco_company_types item=company}
                    <option value="{$company}">{l s=$company mod='payco'}</option>
                {/foreach}
            </select>
        </p>
        <input type="submit" value="{l s='I confirm my order' mod='payco'}" class="exclusive_large" />
        <p class="cart_navigation" id="cart_navigation">
            <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="button_large">{l s='Other payment methods' mod='payco'}</a>
        </p>
    {/if}
</form>
{debug}