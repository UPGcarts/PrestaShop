<p class="payment_module">
    <a href="{$link->getModuleLink('hostedpayments', 'payment', [], true)|escape:'html'}" title="{$name|escape:'html'}">
        {if $image != ""}
            <img src="{$image}" alt="{$name|escape:'html'}" />
        {/if}
        {$name|escape:'html'}
    </a>
</p>