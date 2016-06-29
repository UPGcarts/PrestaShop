Configuration
=============

On the configuration screen you will see the following options:

* Merchant ID : The Merchant ID provided by payment gateway provider
* Store ID : Default store ID provided by payment gateway provider
* Key : Shared key provided by the payment gateway provider for signing requests and responses from the API
* Mode : Config to set the store integration mode
* Default Locale : Default language setting for the Iframe. By default the module will attempt to get the users current language and if the user language is supported. The users session language will be used for the payment gateway provider iframe
* Default User Risk Class : Default user risk class for all transactions
* Auto capture : Should the payment be autocaptured by default
* Status for Autocapture for Paid orders : Once your payment gateway provider confirmed the order is paid, what status to set the order to
* Status for Non Autocapture for Paid orders : If order can not be autocaptured or autocapture is not enabled, what to set the order status to
* Status for Pay pending orders : If Payment Gateway Provider MNS system sends the pay_pending update, what to set the order status to
* Status for Payment failed orders : If Payment Gateway Provider MNS system sends the payment_failed update, what to set the order status to
* Status for orders with charge back : If Payment Gateway Provider MNS system sends the chargeback update, what to set the order status to
* Status for cleared orders : If Payment Gateway Provider MNS system sends the cleared update, what to set the order status to
* Status for cleared In Dunning order : If Payment Gateway Provider MNS system sends the in_dunning update what to set the order status to
* Status for Acknowledge pending orders : If Payment Gateway Provider MNS system sends the acknowledge_pending update what to set the order status to
* Status for fraud check pending orders : If Payment Gateway Provider has flaged a potential fraud with the order what to set the order status to
* Status for CIA pending orders : For cash in advance orders what to set the status to if Payment Gateway is waiting for payment
* Status for Merchant Pending orders : For orders where Payment Gateway is waiting for the merchant to capture payment
* Status for in progress orders : If Payment Gateway MNS system sends the INPROGRESS update, set the order status to this

The last settings are normally called 'Store Id : <currency code>' is for multi currency stores as Payment Gateway requires a store id for each currency

Details to send to Payment Gateway Provider
-------------------------------------------

Payment Gateway Provider will requires some Urls for the callbacks the urls that will need to be sent are bellow. Please note <prestashop url> is the domain ideally over ssl and includes the subfolder if applicable to your prestashop store.

Callback Url: <prestashop url>/module/hostedpayments/callback
MNS Url: <prestashop url>/module/hostedpayments/mns

Module Requirements
-------------------
The Payment Gateway API requires that each transaction sends through the gender of the customer. For this purpose the if you wish to use the module then the user title is now a required field and each title must have an assigned gender.

In the admin if you go to Customer->Titles ensure each title listed has the gender set to Male or Female.
You will also need to modify your template to make the title a required field.

MNS Processing
--------------
A cron process needs to be setup to Processing the MNS update messages. The url which needs to be setup with cron is:
<store url>/module/hostedpayments/mns-cron.php

This cron should be run every 2 to 5 minutes.