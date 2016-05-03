Configuration
=============

On the configuration screen you will see the following options:

* Merchant ID : The Merchant ID provided by UPG
* Store ID : Default store ID provided by UPG
* Key : Shared key provided by UPG for signing requests and responses from the API
* Mode : Config to set the store integration mode
* Default Locale : Default language setting for the Iframe. By default the module will attempt to get the users current language and if the user language is supported. The users session language will be used for the UPG iframe
* Default User Risk Class : Default user risk class for all transactions
* Auto capture : Should the payment be autocaptured by default
* Status for Autocapture for Paid orders : Once UPG confirmed the order is paid which status to set the order to
* Status for Non Autocapture for Paid orders : If order can not be autocaptured or autocapture is not enabled what to set the order status to
* Status for Pay pending orders : If UPG MNS sends the pay_pending update, what to set the order status to
* Status for Payment failed orders : If UPG MNS sends the payment_failed update, what to set the order status to
* Status for orders with charge back : If UPG MNS sends the chargeback update, what to set the order status to
* Status for cleared orders : If UPG MNS sends the cleared update, what to set the order status to
* Status for cleared In Dunning order : If UPG MNS sends the in_dunning update, what to set the order status to
* Status for Acknowledge pending orders : If UPG MNS sends the acknowledge_pending update, what to set the order status to
* Status for fraud check pending orders : If UPG has flaged a potential fraud with the order, what to set the order status to
* Status for CIA pending orders : For cash in advance orders, what to set the order status to if UPG is waiting for payment
* Status for Merchant Pending orders : For orders where UPG is waiting for the merchant to capture payment, what to set the order status to
* Status for in progress orders : If UPG MNS sends the INPROGRESS update, what to set the order status to

The last settings are normally called 'Store Id : <currency code>' is for multi currency stores as UPG requires a store id for each currency

Details to send to UPG
----------------------

UPG requires to be told some Urls for the callback and the MNS saving the urls you will need to tell UPG are as follows for stores with seo friendly urls:

Callback Url: <store domain>/module/upg/callback
MNS Url: <store domain>/module/upg/mns

Module Requirements
-------------------
The UPG API requires that each transaction sends through the gender of the customer. For this purpose the if you wish to use the module then the user title is now a required field and each title must have an assigned gender.

In the admin if you go to Customer->Titles, ensure each title listed has the gender set to Male or Female
You will also need to modify your template to make the title a required field

MNS Processing
--------------
A cron process needs to be setup to Processing the MNS update messages. The url which needs to be setup with cron is:
<store url>/modules/upg/mns-cron.php

This cron should be run every 2 to 5 minutes.
