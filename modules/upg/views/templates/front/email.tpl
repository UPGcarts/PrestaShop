<p style="border-bottom:1px solid #D6D4D4;margin:3px 0 7px;text-transform:uppercase;font-weight:500;font-size:18px;padding-bottom:10px">Here are your payment details</p>
<span style="color:#777">
    <span style="color:#333"><strong>{l s='Payment Method'}:</strong></span>
    {if $paymentMethod == 'DD'}
        {l s='Direct Debit'}
    {/if}
    {if $paymentMethod == 'CC'}
        {l s='Credit Card'}
    {/if}
    {if $paymentMethod == 'CC3D'}
        {l s='Credit Card with 3D secure'}
    {/if}
    {if $paymentMethod == 'PREPAID'}
        {l s='Prepaid'}
    {/if}
    {if $paymentMethod == 'PAYPAL'}
        {l s='PayPal'}
    {/if}
    {if $paymentMethod == 'SU'}
        {l s='Sofortüberweisung'}
    {/if}
    {if $paymentMethod == 'BILL'}
        {l s='Bill payment without payment guarantee'}
    {/if}
    {if $paymentMethod == 'BILL_SECURE'}
        {l s='Bill payment with payment guarantee'}
    {/if}
    {if $paymentMethod == 'COD'}
        {l s='Cash on delivery'}
    {/if}
    {if $paymentMethod == 'IDEAL'}
        {l s='IDEAL'}
    {/if}
    {if $paymentMethod == 'INSTALLMENT'}
        {l s='INSTALLMENT'}
    {/if}
    {if $paymentMethod == 'PAYCO_WALLET'}
        {l s='Payco Wallet'}
    {/if}
    {if $paymentMethod == 'DUMMY'}
        {l s='Dummy'}
    {/if}
    <br />
    {if 'bankname'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Bank Name'}:</strong></span> {$additionalData['bankname']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'bic'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='BIC'}:</strong></span> {$additionalData['bic']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'iban'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='IBAN'}:</strong></span> {$additionalData['iban']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'bankAccountHolder'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Bank Account Holder'}:</strong></span> {$additionalData['bankAccountHolder']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'paymentReference'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Payment Reference'}:</strong></span> {$additionalData['paymentReference']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'sepaMandate'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Sepa Mandate'}:</strong></span> {$additionalData['sepaMandate']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'email'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Email'}:</strong></span> {$additionalData['email']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressCo'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Co'}:</strong></span> {$additionalData['deliveryAddressCo']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressZip'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Zip'}:</strong></span> {$additionalData['deliveryAddressZip']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressNo'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address No'}:</strong></span> {$additionalData['deliveryAddressNo']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressZip'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Zip'}:</strong></span> {$additionalData['deliveryAddressZip']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressNoAdditional'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address No Additional'}:</strong></span> {$additionalData['deliveryAddressNoAdditional']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressCity'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address City'}:</strong></span> {$additionalData['deliveryAddressCity']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressState'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address State'}:</strong></span> {$additionalData['deliveryAddressState']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressStreet'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Street'}:</strong></span> {$additionalData['deliveryAddressStreet']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressRecipient'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Recipient'}:</strong></span> {$additionalData['deliveryAddressRecipient']|escape:'html':'UTF-8'}<br />
    {/if}
    {if 'deliveryAddressCountry'|array_key_exists:$additionalData}
        <span style="color:#333"><strong>{l s='Delivery Address Country'}:</strong></span> {$additionalData['deliveryAddressCountry']|escape:'html':'UTF-8'}<br />
    {/if}
</span>