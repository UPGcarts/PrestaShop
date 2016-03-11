<table id="payco-tab" width="100%">
    <tr>
        <td class="payment left white" width="100%">
            <p>{l s='Payment Information' pdf='true' mod='upg'}</p>
            <table width="100%" border="0">
                <tr>
                    <td class="">{l s='Payment Method' mod='upg'}</td>
                    {if $paymentMethod == 'DD'}
                        <td>{l s='Direct Debit' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'CC'}
                        <td>{l s='Credit Card' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'CC3D'}
                        <td>{l s='Credit Card with 3D secure' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'PREPAID'}
                        <td>{l s='Prepaid' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'PAYPAL'}
                        <td>{l s='PayPal' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'SU'}
                        <td>{l s='Sofortüberweisung' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'BILL'}
                        <td>{l s='Bill payment without payment guarantee' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'BILL_SECURE'}
                        <td>{l s='Bill payment with payment guarantee' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'COD'}
                        <td>{l s='Cash on delivery' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'IDEAL'}
                        <td>{l s='IDEAL' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'INSTALLMENT'}
                        <td>{l s='INSTALLMENT' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'PAYCO_WALLET'}
                        <td>{l s='Payco Wallet' mod='upg'}</td>
                    {/if}
                    {if $paymentMethod == 'DUMMY'}
                        <td>{l s='Dummy' mod='upg'}</td>
                    {/if}
                </tr>
                {if 'bankname'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Bank Name' mod='upg'}</td>
                        <td>{$additionalData['bankname']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'bic'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='BIC' mod='upg'}</td>
                        <td>{$additionalData['bic']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'iban'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='IBAN' mod='upg'}</td>
                        <td>{$additionalData['iban']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'bankAccountHolder'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Bank Account Holder' mod='upg'}</td>
                        <td>{$additionalData['bankAccountHolder']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'paymentReference'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Payment Reference' mod='upg'}</td>
                        <td>{$additionalData['paymentReference']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'sepaMandate'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Sepa Mandate' mod='upg'}</td>
                        <td>{$additionalData['sepaMandate']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'email'|array_key_exists:$additionalData}
                    <dt>{l s='Email'}</dt>
                    <dd>{$additionalData['email']|escape:'html':'UTF-8'}</dd>
                {/if}
                {if 'deliveryAddressCo'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Co' mod='upg'}</td>
                        <td>{$additionalData['deliveryAddressCo']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressZip'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Zip' mod='upg'}</td>
                        <td>{$additionalData['deliveryAddressZip']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressNo'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address No' mod='upg'}</td>
                        <td>{$additionalData['deliveryAddressNo']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressZip'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Zip' mod='upg'}</td>
                        <td>{$additionalData['deliveryAddressZip']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressNoAdditional'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address No Additional' mod='upg'}</td>
                        <td>{$additionalData['deliveryAddressNoAdditional']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressCity'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address City' mod='upg'}</td>
                        <td>{$additionalData['deliveryAddressCity']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressState'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address State' mod='upg'}</td>
                        <td>{$additionalData['deliveryAddressState']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressStreet'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Street' mod='upg'}</td>
                        <td>{$additionalData['deliveryAddressStreet']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressRecipient'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Recipient' mod='upg'}</td>
                        <td>{$additionalData['deliveryAddressRecipient']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'deliveryAddressCountry'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Delivery Address Country' mod='upg'}</td>
                        <td>{$additionalData['deliveryAddressCountry']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
                {if 'payolutionInvoiceInfo'|array_key_exists:$additionalData}
                    <tr>
                        <td>{l s='Payolution Invoice Info' mod='upg'}</td>
                        <td>{$additionalData['payolutionInvoiceInfo']|escape:'html':'UTF-8'}</td>
                    </tr>
                {/if}
            </table>
        </td>
    </tr>
</table>