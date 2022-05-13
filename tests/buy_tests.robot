*** Settings ***
Resource                ../resources.robot
Resource                ../steps/buy_steps.robot
Test Setup              Open Sign In Page Using Chrome Browser
Test Teardown          Close Browser

*** Variables ***
${existing_email}       solabanabasle+test@gmail.com
${password}             S0led4dG4rr0

*** Test Cases ***
The User Buys 2 Dresses (One Pink And One Beige)
    GIVEN The User Has Logged In    ${existing_email}   ${password}
    WHEN The User Clicks On Evening Dresses
    AND The User Filters The Catalog By Color   Beige
    AND The User Selects The First Product
    THEN The User Visualizes The Product's Page
    AND The User Selects Color  Beige
    AND The User Selects Size   M
    AND The User Clicks On Add To Cart Button
    THEN The User Visualizes The Added To Cart Dialog
    WHEN The User Clicks On Continue Shopping Button
    AND The User Clicks On Evening Dresses
    AND The User Filters The Catalog By Color   Pink
    AND The User Selects The First Product
    THEN The User Visualizes The Product's Page
    AND The User Selects Color  Pink
    AND The User Selects Size   S
    AND The User Clicks On Add To Cart Button
    THEN The User Visualizes The Added To Cart Dialog
    WHEN The User Clicks On Proceed To Checkout
    THEN The User Visualizes Added To Cart Dresses on Summary   Beige   M   Pink    S
    WHEN The User Clicks On Proceed To Checkout on Cart Summary
    AND The User Clicks On Proceed To Checkout on Address Section
    AND The User Agrees and Clicks On Proceed To Checkout on Shipping Section
    AND The User Clicks On Pay By Check Button
    AND The User Clicks On I Confirm My Order Button
    THEN The User Visualizes The Message    Your order on My Store is complete.
    WHEN The User Clicks On Back To Orders Button
    THEN The User Visualizes The Order Details on Order History Page    Beige   M   Pink    S
