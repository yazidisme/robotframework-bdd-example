*** Settings ***
Resource          ../pages/sign_in_pages.robot
Resource          ../pages/create_account_pages.robot
Resource          ../pages/my_account_pages.robot

*** Keywords ***
Create Email Address
    ${random} =     Generate Random String  12
    ${email} =      Catenate    solanabasle+test${random}@gmail.com
    [Return]    ${email}

The User Has Opened Sign In Page
    Verify Sign In Page Opened

The User Inputs Email Address
    [Arguments]     ${email}
    Input Email     ${email}

Create An Account Button Should Be Enabled
    Verify Create An Account Button Is Enabled

The User Clicks On Create An Account Button
    Click On Create An Account Button

The User Visualizes Create An Account Page Correctly
    Verify Create An Account Page Opened

The User Fills All Data Fields
    [Arguments]                             ${email}    ${data}
    Fill All Create Account Form Fields     ${email}    ${data}

The User Clicks On Register Button
    Click On Register Button

The User Visualizes My Account Page Correctly
    Verify My Account Page Opened

The User Visualizes Invalid Email Address Error Message
    Verify Invalid Email Address Error Message Appears

The User Visualizes Already Registered Account Error Message
    Verify Already Registered Account Error Message Appears
