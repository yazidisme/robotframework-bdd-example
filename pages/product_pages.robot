*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${PRODUCT_CONTAINER}            id:product
${PRODUCT_COLOR_BEIGE}          id:color_7
${PRODUCT_COLOR_PINK}           id:color_24
${PRODUCT_SIZE}                 id:group_1
${ADD_TO_CART_BUTTON}           css:#add_to_cart button
${ADDED_TO_CART_DIALOG}         id:layer_cart
${CONTINUE_SHOPPING_BUTTON}     css:.continue.btn
${PROCEED_TO_CHECKOUT_BUTTON}   css:a[title="Proceed to checkout"]

*** Keywords ***
Verify Product's Page Opened
    Wait Until Element Is Visible   ${PRODUCT_CONTAINER}    15
    Element Should Be Visible       ${PRODUCT_CONTAINER}

Select Color
    [Arguments]         ${color}
    ${COLOR_UPPER}      Convert To Uppercase    ${color}
    Click Element       ${PRODUCT_COLOR_${COLOR_UPPER}}

Select Size
    [Arguments]                 ${size}
    Select From List By Label   ${PRODUCT_SIZE}     ${size}

Click Add To Cart Button
    Click Element       ${ADD_TO_CART_BUTTON}

Verify Added To Cart Dialog Opened
    Wait Until Element Is Visible   ${ADDED_TO_CART_DIALOG}     30
    Element Should Be Visible       ${ADDED_TO_CART_DIALOG}

Click Continue Shopping Button
    Click Element       ${CONTINUE_SHOPPING_BUTTON}

Click Proceed To Checkout Button
    Click Element       ${PROCEED_TO_CHECKOUT_BUTTON}
