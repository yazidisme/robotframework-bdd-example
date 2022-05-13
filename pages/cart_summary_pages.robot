*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${CART_DESCRIPTION1}                    ((//td[contains(@class, "cart_description")])[1]//a)[2]
${CART_DESCRIPTION2}                    ((//td[contains(@class, "cart_description")])[2]//a)[2]
${PROCEED_TO_CHECKOUT_SUMMARY_BUTTON}   (//a[@title="Proceed to checkout"])[2]
${PROCEED_TO_CHECKOUT_ADDRESS_BUTTON}   css:button[name="processAddress"]
${PROCEED_TO_CHECKOUT_SHIPPING_BUTTON}  css:button[name="processCarrier"]
${CHECKBOX_AGREE}                       id:cgv
${PAY_BY_CHECK_BUTTON}                  css:a.cheque
${CONFIRM_ORDER_BUTTON}                 //button[contains(., "I confirm my order")]
${MESSAGE_ORDER_COMPLETED}              css:.alert-success
${BACK_TO_ORDERS_BUTTON}                css:a[title="Back to orders"]

*** Keywords ***
Verify Added To Cart Dresses Data Is Correct
    [Arguments]                         ${color1}   ${size1}    ${color2}   ${size2}
    Wait Until Element Is Visible       ${CART_DESCRIPTION1}    15
    Element Should Be Visible           ${CART_DESCRIPTION1}
    ${description1}                     Get Text                ${CART_DESCRIPTION1}
    Should Contain Any                  ${description1}         ${color1}               ${size1}
    Wait Until Element Is Visible       ${CART_DESCRIPTION2}    15
    Element Should Be Visible           ${CART_DESCRIPTION2}
    ${description2}                     Get Text                ${CART_DESCRIPTION2}
    Should Contain Any                  ${description2}         ${color2}               ${size2}

Click Proceed To Checkout Button on Cart Summary
    Click Element       ${PROCEED_TO_CHECKOUT_SUMMARY_BUTTON}

Click Proceed To Checkout Button on Address Section
    Click Element       ${PROCEED_TO_CHECKOUT_ADDRESS_BUTTON}

Agree To The Terms Of Service
    Click Element       ${CHECKBOX_AGREE}

Click Proceed To Checkout on Shipping Section
    Click Element       ${PROCEED_TO_CHECKOUT_SHIPPING_BUTTON}

Click Pay By Check Button
    Click Element       ${PAY_BY_CHECK_BUTTON}

Click Confirm Order Button
    Click Element       ${CONFIRM_ORDER_BUTTON}

Verify Message Appears
    [Arguments]                         ${message}
    Wait Until Element Is Visible       ${MESSAGE_ORDER_COMPLETED}  15
    Element Should Be Visible           ${MESSAGE_ORDER_COMPLETED}
    ${text}                             Get Text                    ${MESSAGE_ORDER_COMPLETED}
    Should Be Equal As Strings          ${text}                     ${message}

Click Back To Orders Button
    Click Element       ${BACK_TO_ORDERS_BUTTON}