*** Settings ***
Resource            ../pages/sign_in_pages.robot
Resource            ../pages/catalog_pages.robot
Resource            ../pages/product_pages.robot
Resource            ../pages/cart_summary_pages.robot
Resource            ../pages/order_history_pages.robot

*** Keywords ***
The User Has Logged In
    [Arguments]     ${email}    ${password}
    Log In          ${email}    ${password}

The User Clicks On Evening Dresses
    Click On Evening Dresses

The User Filters The Catalog By Color
    [Arguments]         ${color}
    Filter By Color     ${color}

The User Selects The First Product
    Select First Product

The User Visualizes The Product's Page
    Verify Product's Page Opened

The User Selects Color
    [Arguments]         ${color}
    Select Color        ${color}

The User Selects Size
    [Arguments]         ${size}
    Select Size         ${size}

The User Clicks On Add To Cart Button
    Click Add To Cart Button

The User Visualizes The Added To Cart Dialog
    Verify Added To Cart Dialog Opened

The User Clicks On Continue Shopping Button
    Click Continue Shopping Button

The User Clicks On Proceed To Checkout
    Click Proceed To Checkout Button

The User Visualizes Added To Cart Dresses on Summary
    [Arguments]                                     ${color1}   ${size1}    ${color2}   ${size2}
    Verify Added To Cart Dresses Data Is Correct    ${color1}   ${size1}    ${color2}   ${size2}

The User Clicks On Proceed To Checkout on Cart Summary
    Click Proceed To Checkout Button on Cart Summary

The User Clicks On Proceed To Checkout on Address Section
    Click Proceed To Checkout Button on Address Section

The User Agrees and Clicks On Proceed To Checkout on Shipping Section
    Agree To The Terms Of Service
    Click Proceed To Checkout on Shipping Section

The User Clicks On Pay By Check Button
    Click Pay By Check Button

The User Clicks On I Confirm My Order Button
    Click Confirm Order Button

The User Visualizes The Message
    [Arguments]                 ${message}
    Verify Message Appears      ${message}

The User Clicks On Back To Orders Button
    Click Back To Orders Button

The User Visualizes The Order Details on Order History Page
    [Arguments]                 ${color1}   ${size1}    ${color2}   ${size2}
    Verify Order Details        ${color1}   ${size1}    ${color2}   ${size2}
