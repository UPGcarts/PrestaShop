<table id="payco-tab" width="100%">
    <tr>
        <td class="payment left white" width="100%">
            <p>{l s='Payment Information' pdf='true'}</p>
            <table width="100%" border="0">
                <tr>
                    <td class="">{l s='Payment Method'}</td>
                    {if $paymentMethod == 'DD'}
                        <td>{l s='Direct Debit'}</td>
                    {/if}
                    {if $paymentMethod == 'CC'}
                        <td>{l s='Credit Card'}</td>
                    {/if}
                    {if $paymentMethod == 'CC3D'}
                        <td>{l s='Credit Card with 3D secure'}</td>
                    {/if}
                    {if $paymentMethod == 'PREPAID'}
                        <td>{l s='Prepaid'}</td>
                    {/if}
                    {if $paymentMethod == 'PAYPAL'}
                        <td>{l s='PayPal'}</td>
                    {/if}
                    {if $paymentMethod == 'SU'}
                        <td>{l s='Sofortüberweisung'}</td>
                    {/if}
                    {if $paymentMethod == 'BILL'}
                        <td>{l s='Bill payment without payment guarantee'}</td>
                    {/if}
                    {if $paymentMethod == 'BILL_SECURE'}
                        <td>{l s='Bill payment with payment guarantee'}</td>
                    {/if}
                    {if $paymentMethod == 'COD'}
                        <td>{l s='Cash on delivery'}</td>
                    {/if}
                    {if $paymentMethod == 'IDEAL'}
                        <td>{l s='IDEAL'}</td>
                    {/if}
                    {if $paymentMethod == 'INSTALLMENT'}
                        <td>{l s='INSTALLMENT'}</td>
                    {/if}
                    {if $paymentMethod == 'PAYCO_WALLET'}
                        <td>{l s='Payco Wallet'}</td>
                    {/if}
                    {if $paymentMethod == 'DUMMY'}
                        <td>{l s='Dummy'}</td>
                    {/if}
                </tr>
                {if 'bankname'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Bank Name'}</td>
                        <td>{$additionalData['bankname']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'bic'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='BIC'}</td>
                        <td>{$additionalData['bic']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'iban'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='IBAN'}</td>
                        <td>{$additionalData['iban']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'bankAccountHolder'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Bank Account Holder'}</td>
                        <td>{$additionalData['bankAccountHolder']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'paymentReference'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Payment Reference'}</td>
                        <td>{$additionalData['paymentReference']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'sepaMandate'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Sepa Mandate'}</td>
                        <td>{$additionalData['sepaMandate']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'email'|array_key_exists:$additionalData}
                    <dt>{l s='Email'}</dt>
                    <dd>{$additionalData['email']|escape:'html':'UTF-8'}</dd>
                {/if}
                {if 'deliveryAddressCo'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Co'}</td>
                        <td>{$additionalData['deliveryAddressCo']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressZip'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Zip'}</td>
                        <td>{$additionalData['deliveryAddressZip']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressNo'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address No'}</td>
                        <td>{$additionalData['deliveryAddressNo']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressZip'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Zip'}</td>
                        <td>{$additionalData['deliveryAddressZip']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressNoAdditional'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address No Additional'}</td>
                        <td>{$additionalData['deliveryAddressNoAdditional']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressCity'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address City'}</td>
                        <td>{$additionalData['deliveryAddressCity']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressState'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address State'}</td>
                        <td>{$additionalData['deliveryAddressState']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressStreet'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Street'}</td>
                        <td>{$additionalData['deliveryAddressStreet']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressRecipient'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Recipient'}</td>
                        <td>{$additionalData['deliveryAddressRecipient']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressCountry'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Country'}</td>
                        <td>{$additionalData['deliveryAddressCountry']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'payolutionInvoiceInfo'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Payolution Invoice Info'}</td>
                        <td>{$additionalData['payolutionInvoiceInfo']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
            </table>
        </td>
    </tr>
</table>