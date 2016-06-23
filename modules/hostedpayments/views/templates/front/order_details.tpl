<div class="adresses_bloc">
    <div class="row">
        <div class="col-xs-12 col-sm-6">
            <ul class="address item full_width box">
                <li><h3 class="page-subheading">{l s='Payment Details'}</h3></li>
                <li>
                    <dl>
                        <dt>{l s='Payment Method' mod='hostedpayments'}</dt>
                        {if $paymentMethod == 'DD'}
                            <dd>{l s='Direct Debit' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'CC'}
                            <dd>{l s='Credit Card' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'CC3D'}
                            <dd>{l s='Credit Card with 3D secure' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'PREPAID'}
                            <dd>{l s='Prepaid' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'PAYPAL'}
                            <dd>{l s='PayPal' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'SU'}
                            <dd>{l s='Sofortüberweisung' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'BILL'}
                            <dd>{l s='Bill payment without payment guarantee' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'BILL_SECURE'}
                            <dd>{l s='Bill payment with payment guarantee' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'COD'}
                            <dd>{l s='Cash on delivery' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'IDEAL'}
                            <dd>{l s='IDEAL' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'INSTALLMENT'}
                            <dd>{l s='INSTALLMENT' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'PAYCO_WALLET'}
                            <dd>{l s='Payco Wallet' mod='hostedpayments'}</dd>
                        {/if}
                        {if $paymentMethod == 'DUMMY'}
                            <dd>{l s='Dummy' mod='hostedpayments'}</dd>
                        {/if}
                        {if 'bankname'|array_key_exists:$additionalData}
                            <dt>{l s='Bank Name' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['bankname']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'bic'|array_key_exists:$additionalData}
                            <dt>{l s='BIC' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['bic']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'iban'|array_key_exists:$additionalData}
                            <dt>{l s='IBAN' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['iban']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'bankAccountHolder'|array_key_exists:$additionalData}
                            <dt>{l s='Bank Account Holder' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['bankAccountHolder']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'paymentReference'|array_key_exists:$additionalData}
                            <dt>{l s='Payment Reference' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['paymentReference']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'sepaMandate'|array_key_exists:$additionalData}
                            <dt>{l s='Sepa Mandate' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['sepaMandate']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'email'|array_key_exists:$additionalData}
                            <dt>{l s='Email' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['email']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'deliveryAddressCo'|array_key_exists:$additionalData}
                            <dt>{l s='Delivery Address Co' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['deliveryAddressCo']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'deliveryAddressZip'|array_key_exists:$additionalData}
                            <dt>{l s='Delivery Address Zip' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['deliveryAddressZip']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'deliveryAddressNo'|array_key_exists:$additionalData}
                            <dt>{l s='Delivery Address No' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['deliveryAddressNo']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'deliveryAddressZip'|array_key_exists:$additionalData}
                            <dt>{l s='Delivery Address Zip' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['deliveryAddressZip']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'deliveryAddressNoAdditional'|array_key_exists:$additionalData}
                            <dt>{l s='Delivery Address No Additional' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['deliveryAddressNoAdditional']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'deliveryAddressCity'|array_key_exists:$additionalData}
                            <dt>{l s='Delivery Address City' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['deliveryAddressCity']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'deliveryAddressState'|array_key_exists:$additionalData}
                            <dt>{l s='Delivery Address State' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['deliveryAddressState']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'deliveryAddressStreet'|array_key_exists:$additionalData}
                            <dt>{l s='Delivery Address Street' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['deliveryAddressStreet']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'deliveryAddressRecipient'|array_key_exists:$additionalData}
                            <dt>{l s='Delivery Address Recipient' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['deliveryAddressRecipient']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'deliveryAddressCountry'|array_key_exists:$additionalData}
                            <dt>{l s='Delivery Address Country' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['deliveryAddressCountry']|escape:'html':'UTF-8'}</dd>
                        {/if}
                        {if 'payolutionInvoiceInfo'|array_key_exists:$additionalData}
                            <dt>{l s='Payolution Invoice Info' mod='hostedpayments'}</dt>
                            <dd>{$additionalData['payolutionInvoiceInfo']|escape:'html':'UTF-8'}</dd>
                        {/if}
                    </dl>
                </li>
            </ul>
        </div>
    </div>
</div>