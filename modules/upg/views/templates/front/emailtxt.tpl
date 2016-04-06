{l s='Payment Method'}:
{if $paymentMethod == 'DD'}
    {l s='Direct Debit' mod='upg'}
{/if}
{if $paymentMethod == 'CC'}
    {l s='Credit Card' mod='upg'}
{/if}
{if $paymentMethod == 'CC3D'}
    {l s='Credit Card with 3D secure' mod='upg'}
{/if}
{if $paymentMethod == 'PREPAID'}
    {l s='Prepaid' mod='upg'}
{/if}
{if $paymentMethod == 'PAYPAL'}
    {l s='PayPal' mod='upg'}
{/if}
{if $paymentMethod == 'SU'}
    {l s='Sofortüberweisung' mod='upg'}
{/if}
{if $paymentMethod == 'BILL'}
    {l s='Bill payment without payment guarantee' mod='upg'}
{/if}
{if $paymentMethod == 'BILL_SECURE'}
    {l s='Bill payment with payment guarantee' mod='upg'}
{/if}
{if $paymentMethod == 'COD'}
    {l s='Cash on delivery' mod='upg'}
{/if}
{if $paymentMethod == 'IDEAL'}
    {l s='IDEAL' mod='upg'}
{/if}
{if $paymentMethod == 'INSTALLMENT'}
    {l s='INSTALLMENT' mod='upg'}
{/if}
{if $paymentMethod == 'PAYCO_WALLET'}
    {l s='Payco Wallet' mod='upg'}
{/if}
{if $paymentMethod == 'DUMMY'}
    {l s='Dummy' mod='upg'}
{/if}
{if 'bankname'|array_key_exists:$additionalData}
    {l s='Bank Name' mod='upg'}: {$additionalData['bankname']}
{/if}
{if 'bic'|array_key_exists:$additionalData}
    {l s='BIC' mod='upg'}: {$additionalData['bic']}
{/if}
{if 'iban'|array_key_exists:$additionalData}
    {l s='IBAN' mod='upg'}: {$additionalData['iban']}
{/if}
{if 'bankAccountHolder'|array_key_exists:$additionalData}
    {l s='Bank Account Holder' mod='upg'}: {$additionalData['bankAccountHolder']}
{/if}
{if 'paymentReference'|array_key_exists:$additionalData}
    {l s='Payment Reference' mod='upg'}: {$additionalData['paymentReference']}
{/if}
{if 'sepaMandate'|array_key_exists:$additionalData}
    {l s='Sepa Mandate' mod='upg'}: {$additionalData['sepaMandate']}
{/if}
{if 'email'|array_key_exists:$additionalData}
    {l s='Email' mod='upg'}: {$additionalData['email']}
{/if}
{if 'deliveryAddressCo'|array_key_exists:$additionalData}
    {l s='Delivery Address Co' mod='upg'}: {$additionalData['deliveryAddressCo']}
{/if}
{if 'deliveryAddressZip'|array_key_exists:$additionalData}
    {l s='Delivery Address Zip' mod='upg'}: {$additionalData['deliveryAddressZip']}
{/if}
{if 'deliveryAddressNo'|array_key_exists:$additionalData}
    {l s='Delivery Address No' mod='upg'}: {$additionalData['deliveryAddressNo']}
{/if}
{if 'deliveryAddressZip'|array_key_exists:$additionalData}
    {l s='Delivery Address Zip' mod='upg'}: {$additionalData['deliveryAddressZip']}
{/if}
{if 'deliveryAddressNoAdditional'|array_key_exists:$additionalData}
    {l s='Delivery Address No Additional' mod='upg'}: {$additionalData['deliveryAddressNoAdditional']}
{/if}
{if 'deliveryAddressCity'|array_key_exists:$additionalData}
    {l s='Delivery Address City' mod='upg'}: {$additionalData['deliveryAddressCity']}
{/if}
{if 'deliveryAddressState'|array_key_exists:$additionalData}
    {l s='Delivery Address State' mod='upg'}: {$additionalData['deliveryAddressState']}
{/if}
{if 'deliveryAddressStreet'|array_key_exists:$additionalData}
    {l s='Delivery Address Street' mod='upg'}: {$additionalData['deliveryAddressStreet']}
{/if}
{if 'deliveryAddressRecipient'|array_key_exists:$additionalData}
    {l s='Delivery Address Recipient' mod='upg'}: {$additionalData['deliveryAddressRecipient']}
{/if}
{if 'deliveryAddressCountry'|array_key_exists:$additionalData}
    {l s='Delivery Address Country' mod='upg'}: {$additionalData['deliveryAddressCountry']}
{/if}