<?php
/* -----------------------
--  ADAPTING THIS FILE  --
--------------------------
If you want to adapt this language file, use cust_lang.php instead.
Further information is available in the manual at
https://www.oxid-esales.com/en/support-services/documentation-and-help/archive-oxid-eshop/administer-eshop/customize-texts-and-emails/editing-the-language-files.html
*/

$sLangName  = "English";

// -------------------------------
// RESOURCE IDENTIFIER = STRING
// -------------------------------
$aLang = array(

'charset'                                                     => "UTF-8",
'fullDateFormat'                                              => "Y-m-d H:i:s",
'simpleDateFormat'                                            => "Y-m-d",

'STEPS_BASKET'                                                => "Cart",
'STEPS_ORDER'                                                 => "Order",
'STEPS_PAY'                                                   => "Pay",
'STEPS_SEND'                                                  => "Address",
'LAYOUT_HEADER_BASKET_LINK'                                   => "Basket",
'MOBILE_DETAILS_BACK_TO_PRODUCT'                              => "back to product",
'CONTINUE_TO_NEXT_STEP_MOBILE'                                 => "Next Step",
'SUBMIT_COUPON_MOBILE'                                        => "submit",
'TOTAL_MOBILE'                                                => "Total",
'DETAILS_PRODUCTREVIEW_LINK_MOBILE'                           => "Reviews",
'DETAILS_QUESTIONS'                                           => "Questions about this product?",
'PRICE_ALERT'                                                 => "Price Alert",
'DETAILS_MORE_ACTIONS'                                        => "more",
'PAGE_DETAILS_TABS_REVIEW'                                    => "Reviews",
'STEPS_BASKET_MOBILE'                                         => "Cart", // default value
'STEPS_SEND_MOBILE'                                           => "Address", // default value
'STEPS_ORDER_MOBILE'                                          => "Order", //default value
'WIDGET_PRODUCT_ATTRIBUTES_RESET'                             => "reset",
'WIDGET_MANUFACTURERS_SLIDER_OURBRANDS'                       => "Our Brands",
'MOBILE_NAVIGATION_BUTTON'                                    => "Menu",
'MOBILE_NAVIGATION_TITLE'                                     => "Menu",
'FILESIZE'                                                    => "File size",
'GIFT_OPTIONS_LINK'                                           => "edit gift options",
'COUPONS'                                                     => "Coupons",
'SHIPPING_METHOD'                                             => "Shipping method",
'PRODUCT_REVIEWS'                                             => "Product Reviews",
'ORDER_PAYMENT_SHIPPING'                                      => "Shipping and Payment method",
'ORDER_PAYMENT_SHIPPING_MOBILE'                               => "Shipping and Payment",
'CURRENCY'                                                    => "Currency",
'LANGUAGE'                                                    => "Language",

'BETA_NOTE'                                                   => "Welcome to Release Candidate ",
'BETA_NOTE_MIDDLE'                                            => " of OXID eShop ",
'BETA_NOTE_FAQ'                                               => ". Please refer to our <a href='http://wiki.oxidforge.org/Development/Beta' class=\"external\">FAQ</a> if you have any questions.",

'BETA_NOTE_CLOSE'                                             => "Dismiss message",

'ADD_RECOMM_ADDRECOMMLINK1'                                   => "There is no Listmania lists at the moment. To create new, click",
'ADD_RECOMM_ADDRECOMMLINK2'                                   => "here",
'DETAILS_LOCATOR_PRODUCT'                                     => "PRODUCT",
'DETAILS_VPE_MESSAGE_1'                                       => "This product can only be ordered in packaging units of ",
'DETAILS_VPE_MESSAGE_2'                                       => "",
'DETAILS_CHOOSEVARIANT'                                       => "Please select a variant",
'EMAIL_INVITE_HTML_INVITETOSHOP'                              => "An invitation from",
'EMAIL_INVITE_HTML_INVITETOSHOP2'                             => "to visit",
'EMAIL_INVITE_HTML_INVITETOSHOP3'                             => "",
'EMAIL_ORDER_CUST_HTML_NONE'                                  => "NONE",
'EMAIL_ORDER_CUST_HTML_PAYMENTCHARGEVAT1'                     => "Payment Charge VAT",
'EMAIL_ORDER_OWNER_HTML_PAYMENTINFO'                          => "",
'EMAIL_ORDER_OWNER_HTML_PAYMENTINFOOFF'                       => "",
'FOOTER_CATEGORIES'                                           => "CATEGORIES",
'FOOTER_DISTRIBUTORS'                                         => "DISTRIBUTORS",
'FOOTER_INFORMATION'                                          => "INFORMATION",
'FOOTER_MANUFACTURERS'                                        => "BRANDS",
'FOOTER_SERVICES'                                             => "SERVICE",
'FORM_PRIVATESALES_INVITE_MESSAGE1'                           => "Hello, I was looking at",
'FORM_PRIVATESALES_INVITE_MESSAGE2'                           => "today and found something that might be interesting for you. Just click on the link below and you will be directed to the shop.",
'FORM_REGISTER_COMPLETEMARKEDFIELDS'                          => "(Please fill in all mandatory fields labeled in bold.)",
'FORM_REGISTER_IAGREETORIGHTOFWITHDRAWAL1'                    => "I have been informed about my",
'FORM_REGISTER_IAGREETORIGHTOFWITHDRAWAL3'                    => "",
'FORM_REGISTER_IAGREETOTERMS1'                                => "I agree to the",
'FORM_REGISTER_IAGREETOTERMS3'                                => "",
'FORM_FIELDSET_USER_BILLING_ADDITIONALINFO_TOOLTIP'           => "",
'FORM_FIELDSET_USER_SHIPPING_ADDITIONALINFO2_TOOLTIP'         => "",
'FORM_SUGGEST_MESSAGE1'                                       => "Hello, I was looking at",
'FORM_SUGGEST_MESSAGE2'                                       => "today and found something that might be interesting for you. Just click on the link below and you will be directed to the shop.",
'FORM_WISHLIST_SUGGEST_BUYFORME1'                             => "Hi, I created a Gift Registry at",
'FORM_WISHLIST_SUGGEST_BUYFORME2'                             => ". Great if you could buy something for me.",
'PAGE_ACCOUNT_DASHBOARD_LOGOUT'                               => "LOGOUT",
'PAGE_ACCOUNT_WISHLIST_SENDSUCCESSFULLY1'                     => "Your Gift Registry was sent successfully to:",
'PAGE_ACCOUNT_WISHLIST_SENDSUCCESSFULLY2'                     => "",
'PAGE_CHECKOUT_BASKETCONTENTS_PAYMENTTAX1'                    => "Surcharge VAT",
'PAGE_CHECKOUT_PAYMENT_EMPTY_TEXT'                            => '<p>Currently we have no shipping method set up for this country.</p> <p>We are aiming to find a possible delivery method and we will inform you as soon as possible via e-mail about the result, including further information about delivery costs.</p>',
'PAGE_CHECKOUT_PAYMENT_INCLUDEVAT'                            => "incl. VAT",
'PAGE_CHECKOUT_PAYMENT_PLUSCODCHARGE1'                        => "plus",
'PAGE_CHECKOUT_PAYMENT_PLUSCODCHARGE2'                        => "COD Charge",
'PAGE_CHECKOUT_PAYMENT_TSPROTECTIONTEXT'                      => "The Trusted Shops buyer protection secures your online purchase. I agree with the transfer and",
'PAGE_CHECKOUT_PAYMENT_TSPROTECTIONTEXT2'                     => "saving",
'PAGE_CHECKOUT_PAYMENT_TSPROTECTIONTEXT3'                     => "of my e-mail address for the buyer protection handling by Trusted Shops.",
'PAGE_CHECKOUT_PAYMENT_TSPROTECTIONTEXT4'                     => "Conditions",
'PAGE_CHECKOUT_PAYMENT_TSPROTECTIONTEXT5'                     => "for the buyer protection.",
'PAGE_CHECKOUT_THANKYOU_REGISTEREDYOUORDERNO1'                => "We registered your order under the number:",
'PAGE_CHECKOUT_THANKYOU_REGISTEREDYOUORDERNO2'                => "",
'PAGE_CHECKOUT_THANKYOU_THANKYOU1'                            => "Thank you for your order",
'PAGE_CHECKOUT_THANKYOU_THANKYOU2'                            => "in",
'PAGE_CHECKOUT_USER_OPTION_REGISTRATION_DESCRIPTION'          => "A customer with an account has advantages like:<br> - Administration of shipping addresses<br> - Check order status<br> - Order History<br> - Personal Wish List<br> - Personal Gift Registry<br> - Newsletter subscription<br> - Special offers and discounts",
'PAGE_CHECKOUT_WRAPPING_NONE'                                 => "NONE",
'PAGE_DETAILS_THANKYOUMESSAGE1'                               => "Thank you.",
'PAGE_DETAILS_THANKYOUMESSAGE2'                               => " appreciates your comments.",
'PAGE_DETAILS_THANKYOUMESSAGE3'                               => "We will inform you as soon as the price falls below",
'PAGE_DETAILS_THANKYOUMESSAGE4'                               => ".",
'PAGE_INFO_CONTACT_THANKYOU1'                                 => "Thank you.",
'PAGE_INFO_CONTACT_THANKYOU2'                                 => " appreciates your comments.",
'PAGE_WISHLIST_PRODUCTS_PRODUCTS1'                            => "These products are on the wish list of",
'PAGE_WISHLIST_PRODUCTS_PRODUCTS2'                            => ". If you want to please him/her, purchase one or multiple of these products.",
'allBrands'                                                   => "All Brands",
'byBrand'                                                     => "By Brand",
'byManufacturer'                                              => "By Manufacturer",
'byVendor'                                                    => "By Distributor",
'grid'                                                        => "Grid",
'infogrid'                                                    => "Double grid",
'line'                                                        => "Line",
'searchResult'                                                => 'Search result for "%s"',
'usrRegistered'                                               => "User will be registered after he provided his password",
'view'                                                        => "View",
'EMAIL_STOCKREMINDER_SUBJECT'                                 => 'Stock low',
'EMAIL_SENDDOWNLOADS_GREETING'                                => 'Hello',
'EMAIL_SENDDOWNLOADS_PAYMENT_PENDING'                         => 'Payment of the order is not yet complete.',
'EMAIL_SENDDOWNLOADS_DOWNLOADS_DESC'                          => 'Download your ordered files here.',
'EMAIL_SENDDOWNLOADS_SUBJECT'                                 => 'Download links',
'EMAIL_SENDEDNOW_HTML_ORDERSHIPPEDTO'                         => 'The order is shipped to:',
'EMAIL_SENDEDNOW_HTML_ORDERNOMBER'                            => 'Order No.:',
'EMAIL_SENDEDNOW_HTML_QUANTITY'                               => 'Quantity',
'EMAIL_SENDEDNOW_HTML_PRODUCT'                                => 'Product',
'EMAIL_SENDEDNOW_HTML_PRODUCTRATING'                          => 'Product Rating',
'EMAIL_SENDEDNOW_HTML_ARTNOMBER'                              => 'Art.No.:',
'EMAIL_SENDEDNOW_HTML_REVIEW'                                 => 'review',
'EMAIL_SENDEDNOW_HTML_YUORTEAM1'                              => 'Your',
'EMAIL_SENDEDNOW_HTML_YUORTEAM2'                              => 'Team',
'EMAIL_SENDEDNOW_HTML_TS_RATINGS_RATEUS'                      => 'Please take a minute to rate our shop.',
'EMAIL_SENDEDNOW_HTML_SHIPMENTTRACKING'                       => 'Your shipment tracking URL:',
'EMAIL_SENDEDNOW_HTML_SHIPMENTTRACKINGURL'                    => 'click here',
'PAGE_INFO_CLEARCOOKIE_TITLE'                                 => 'Information about Cookies',
'PAGE_INFO_CLEARCOOKIE_CONTENT'                               => 'You have decided to not accept cookies from our online shop. The cookies have been removed. You can deactivate the usage of cookies in the settings of your browser and visit the online shop with some functional limitations. You can also return to the shop without changing the browser settings and enjoy the full functionality.<br/><br/>Information about cookies at Wikipedia: <a href="http://en.wikipedia.org/wiki/HTTP_cookie"><strong>http://en.wikipedia.org/wiki/HTTP_cookie</strong></a>',
'DELETE_MY_ACCOUNT_WARNING'                                  => 'This action cannot be undone. This will permanently delete your personal data.',
'DELETE_MY_ACCOUNT'                                          => 'Delete account',
'DELETE_MY_ACCOUNT_CONFIRMATION_QUESTION'                    => 'Are you sure you want to delete your account?',
'DELETE_MY_ACCOUNT_CANCEL'                                   => 'Cancel',
'DELETE_MY_ACCOUNT_SUCCESS'                                  => 'The account has been deleted',
'DELETE_MY_ACCOUNT_ERROR'                                    => 'The account could not have been deleted',
'DELETE_REVIEW_AND_RATING'                                   => 'Delete review and star rating',
'REVIEWS_NOT_AVAILABLE'                                      => 'No reviews available',
'DELETE_REVIEW_CONFIRMATION_QUESTION'                        => 'Are you sure you want to delete the review?',
'CHOOSE_DELIVERY'                                            => 'choose',
);
