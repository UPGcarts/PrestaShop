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
<form action="{$link->getModuleLink('hostedpayments', 'process', [], true)|escape:'html'}" class="std" method="post">
            <input type="hidden" name="UPG_BUSINESS" value="1">
            <div class="form-group">
                <label>{l s='Company Registration ID' mod='hostedpayments'}</label>
                <input type="text" class="form-control" name="companyRegistrationID" />
            </div>
            <div class="form-group">
                <label>{l s='Company VAT ID' mod='hostedpayments'}</label>
                <input type="text" class="form-control" name="companyVatID" />
            </div>
            <div class="form-group">
                <label>{l s='Company Tax ID' mod='hostedpayments'}</label>
                <input type="text" class="form-control" name="companyTaxID" />
            </div>
            <div class="form-group">
                <label>{l s='Company Registration Type' mod='hostedpayments'}</label>
                <select id="companyRegisterType" class="form-control" name="companyRegisterType">
                    {foreach from=$upg_company_types item=company}
                        <option value="{$company}">{l s=$company mod='hostedpayments'}</option>
                    {/foreach}
                </select>
            </div>
        <p class="submit2">
            <button type="submit" class="btn btn-default button button-medium">
                <span>{l s='I confirm my order' mod='hostedpayments'}</span>
            </button>
        </p>
        <p class="cart_navigation" id="cart_navigation">
            <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="btn btn-defaul button button-small">
                <span>{l s='Other payment methods' mod='hostedpayments'}</span>
            </a>
        </p>
</form>
{/if}
{debug}