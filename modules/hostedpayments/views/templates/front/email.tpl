<p style="border-bottom:1px solid #D6D4D4;margin:3px 0 7px;text-transform:uppercase;font-weight:500;font-size:18px;padding-bottom:10px">Here are your payment details</p>
<span style="color:#777">
    <span style="color:#333"><strong>{l s='Payment Method'}:</strong></span>
    {if $paymentMethod == 'DD'}
        {l s='Direct Debit' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'CC'}
        {l s='Credit Card' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'CC3D'}
        {l s='Credit Card with 3D secure' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'PREPAID'}
        {l s='Prepaid' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'PAYPAL'}
        {l s='PayPal' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'SU'}
        {l s='Sofortüberweisung' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'BILL'}
        {l s='Bill payment without payment guarantee' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'BILL_SECURE'}
        {l s='Bill payment with payment guarantee' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'COD'}
        {l s='Cash on delivery' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'IDEAL'}
        {l s='IDEAL' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'INSTALLMENT'}
        {l s='INSTALLMENT' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'PAYCO_WALLET'}
        {l s='Payco Wallet' mod='hostedpayments'}
    {/if}
    {if $paymentMethod == 'DUMMY'}
        {l s='Dummy' mod='hostedpayments'}
    {/if}
    <br />
    {if 'bankname'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Bank Name' mod='hostedpayments'}:</strong></span> {$additionalData['bankname']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'bic'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='BIC' mod='hostedpayments'}:</strong></span> {$additionalData['bic']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'iban'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='IBAN' mod='hostedpayments'}:</strong></span> {$additionalData['iban']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'bankAccountHolder'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Bank Account Holder' mod='hostedpayments'}:</strong></span> {$additionalData['bankAccountHolder']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'paymentReference'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Payment Reference' mod='hostedpayments'}:</strong></span> {$additionalData['paymentReference']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'sepaMandate'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Sepa Mandate' mod='hostedpayments'}:</strong></span> {$additionalData['sepaMandate']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'email'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Email' mod='hostedpayments'}:</strong></span> {$additionalData['email']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressCo'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Co' mod='hostedpayments'}:</strong></span> {$additionalData['deliveryAddressCo']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressZip'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Zip' mod='hostedpayments'}:</strong></span> {$additionalData['deliveryAddressZip']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressNo'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address No' mod='hostedpayments'}:</strong></span> {$additionalData['deliveryAddressNo']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressZip'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Zip' mod='hostedpayments'}:</strong></span> {$additionalData['deliveryAddressZip']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressNoAdditional'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address No Additional' mod='hostedpayments'}:</strong></span> {$additionalData['deliveryAddressNoAdditional']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressCity'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address City' mod='hostedpayments'}:</strong></span> {$additionalData['deliveryAddressCity']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressState'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address State' mod='hostedpayments'}:</strong></span> {$additionalData['deliveryAddressState']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressStreet'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Street' mod='hostedpayments'}:</strong></span> {$additionalData['deliveryAddressStreet']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressRecipient'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Recipient' mod='hostedpayments'}:</strong></span> {$additionalData['deliveryAddressRecipient']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressCountry'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Country' mod='hostedpayments'}:</strong></span> {$additionalData['deliveryAddressCountry']|escape:'html':'UTF-8'}<br />
    {/if}
</span>