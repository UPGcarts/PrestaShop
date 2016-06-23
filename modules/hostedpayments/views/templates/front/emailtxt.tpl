{l s='Payment Method'}:
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
{if 'bankname'|array_key_exists:$additionalData}
    {l s='Bank Name' mod='hostedpayments'}: {$additionalData['bankname']}
{/if}
{if 'bic'|array_key_exists:$additionalData}
    {l s='BIC' mod='hostedpayments'}: {$additionalData['bic']}
{/if}
{if 'iban'|array_key_exists:$additionalData}
    {l s='IBAN' mod='hostedpayments'}: {$additionalData['iban']}
{/if}
{if 'bankAccountHolder'|array_key_exists:$additionalData}
    {l s='Bank Account Holder' mod='hostedpayments'}: {$additionalData['bankAccountHolder']}
{/if}
{if 'paymentReference'|array_key_exists:$additionalData}
    {l s='Payment Reference' mod='hostedpayments'}: {$additionalData['paymentReference']}
{/if}
{if 'sepaMandate'|array_key_exists:$additionalData}
    {l s='Sepa Mandate' mod='hostedpayments'}: {$additionalData['sepaMandate']}
{/if}
{if 'email'|array_key_exists:$additionalData}
    {l s='Email' mod='hostedpayments'}: {$additionalData['email']}
{/if}
{if 'deliveryAddressCo'|array_key_exists:$additionalData}
    {l s='Delivery Address Co' mod='hostedpayments'}: {$additionalData['deliveryAddressCo']}
{/if}
{if 'deliveryAddressZip'|array_key_exists:$additionalData}
    {l s='Delivery Address Zip' mod='hostedpayments'}: {$additionalData['deliveryAddressZip']}
{/if}
{if 'deliveryAddressNo'|array_key_exists:$additionalData}
    {l s='Delivery Address No' mod='hostedpayments'}: {$additionalData['deliveryAddressNo']}
{/if}
{if 'deliveryAddressZip'|array_key_exists:$additionalData}
    {l s='Delivery Address Zip' mod='hostedpayments'}: {$additionalData['deliveryAddressZip']}
{/if}
{if 'deliveryAddressNoAdditional'|array_key_exists:$additionalData}
    {l s='Delivery Address No Additional' mod='hostedpayments'}: {$additionalData['deliveryAddressNoAdditional']}
{/if}
{if 'deliveryAddressCity'|array_key_exists:$additionalData}
    {l s='Delivery Address City' mod='hostedpayments'}: {$additionalData['deliveryAddressCity']}
{/if}
{if 'deliveryAddressState'|array_key_exists:$additionalData}
    {l s='Delivery Address State' mod='hostedpayments'}: {$additionalData['deliveryAddressState']}
{/if}
{if 'deliveryAddressStreet'|array_key_exists:$additionalData}
    {l s='Delivery Address Street' mod='hostedpayments'}: {$additionalData['deliveryAddressStreet']}
{/if}
{if 'deliveryAddressRecipient'|array_key_exists:$additionalData}
    {l s='Delivery Address Recipient' mod='hostedpayments'}: {$additionalData['deliveryAddressRecipient']}
{/if}
{if 'deliveryAddressCountry'|array_key_exists:$additionalData}
    {l s='Delivery Address Country' mod='hostedpayments'}: {$additionalData['deliveryAddressCountry']}
{/if}