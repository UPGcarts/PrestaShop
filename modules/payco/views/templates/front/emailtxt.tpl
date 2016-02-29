{l s='Payment Method'}:
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
{if 'bankname'|array_key_exists:$additionalData}
    {l s='Bank Name'}: {$additionalData['bankname']}
{/if}
{if 'bic'|array_key_exists:$additionalData}
    {l s='BIC'}: {$additionalData['bic']}
{/if}
{if 'iban'|array_key_exists:$additionalData}
    {l s='IBAN'}: {$additionalData['iban']}
{/if}
{if 'bankAccountHolder'|array_key_exists:$additionalData}
    {l s='Bank Account Holder'}: {$additionalData['bankAccountHolder']}
{/if}
{if 'paymentReference'|array_key_exists:$additionalData}
    {l s='Payment Reference'}: {$additionalData['paymentReference']}
{/if}
{if 'sepaMandate'|array_key_exists:$additionalData}
    {l s='Sepa Mandate'}: {$additionalData['sepaMandate']}
{/if}
{if 'email'|array_key_exists:$additionalData}
    {l s='Email'}: {$additionalData['email']}
{/if}
{if 'deliveryAddressCo'|array_key_exists:$additionalData}
    {l s='Delivery Address Co'}: {$additionalData['deliveryAddressCo']}
{/if}
{if 'deliveryAddressZip'|array_key_exists:$additionalData}
    {l s='Delivery Address Zip'}: {$additionalData['deliveryAddressZip']}
{/if}
{if 'deliveryAddressNo'|array_key_exists:$additionalData}
    {l s='Delivery Address No'}: {$additionalData['deliveryAddressNo']}
{/if}
{if 'deliveryAddressZip'|array_key_exists:$additionalData}
    {l s='Delivery Address Zip'}: {$additionalData['deliveryAddressZip']}
{/if}
{if 'deliveryAddressNoAdditional'|array_key_exists:$additionalData}
    {l s='Delivery Address No Additional'}: {$additionalData['deliveryAddressNoAdditional']}
{/if}
{if 'deliveryAddressCity'|array_key_exists:$additionalData}
    {l s='Delivery Address City'}: {$additionalData['deliveryAddressCity']}
{/if}
{if 'deliveryAddressState'|array_key_exists:$additionalData}
    {l s='Delivery Address State'}: {$additionalData['deliveryAddressState']}
{/if}
{if 'deliveryAddressStreet'|array_key_exists:$additionalData}
    {l s='Delivery Address Street'}: {$additionalData['deliveryAddressStreet']}
{/if}
{if 'deliveryAddressRecipient'|array_key_exists:$additionalData}
    {l s='Delivery Address Recipient'}: {$additionalData['deliveryAddressRecipient']}
{/if}
{if 'deliveryAddressCountry'|array_key_exists:$additionalData}
    {l s='Delivery Address Country'}: {$additionalData['deliveryAddressCountry']}
{/if}