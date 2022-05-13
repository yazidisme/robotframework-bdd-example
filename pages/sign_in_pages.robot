*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${INPUT_LOGIN_EMAIL}                id:email
${INPUT_LOGIN_PASSWORD}             id:passwd
${BUTTON_SIGN_IN}                   id:SubmitLogin
${INPUT_EMAIL}                      id:email_create
${BUTTON_CREATE_ACCOUNT}            id:SubmitCreate
${MESSAGE_EMAIL_ERROR}              id:create_account_error

*** Keywords ***
Log In
    [Arguments]                         ${email}                    ${password}
    Wait Until Element Is Enabled       ${INPUT_LOGIN_EMAIL}
    Input Text                          ${INPUT_LOGIN_EMAIL}        ${email}
    Wait Until Element Is Enabled       ${INPUT_LOGIN_PASSWORD}
    Input Text                          ${INPUT_LOGIN_PASSWORD}     ${password}
    Click Element                       ${BUTTON_SIGN_IN}

Verify Sign In Page Opened
    Wait Until Element Is Visible       ${INPUT_EMAIL}
    Element Should Be Visible           ${INPUT_EMAIL}
    Wait Until Element Is Visible       ${BUTTON_CREATE_ACCOUNT}
    Element Should Be Visible           ${BUTTON_CREATE_ACCOUNT}

Input email
    [Arguments]                         ${email}
    Wait Until Element Is Enabled       ${INPUT_EMAIL}
    Input Text                          ${INPUT_EMAIL}  ${email}

Verify Create An Account Button Is Enabled
    Wait Until Element Is Enabled       ${BUTTON_CREATE_ACCOUNT}
    Element Should Be Enabled           ${BUTTON_CREATE_ACCOUNT}

Click On Create An Account Button
    Wait Until Element Is Enabled       ${BUTTON_CREATE_ACCOUNT}
    Click Element                       ${BUTTON_CREATE_ACCOUNT}

Verify Invalid Email Address Error Message Appears
    Wait Until Element Is Visible       ${MESSAGE_EMAIL_ERROR}  15
    Element Should Be Visible           ${MESSAGE_EMAIL_ERROR}
    ${error_message}                    Get Text                        ${MESSAGE_EMAIL_ERROR}
    Should Be Equal As Strings          ${error_message}                Invalid email address.

Verify Already Registered Account Error Message Appears
    Wait Until Element Is Visible       ${MESSAGE_EMAIL_ERROR}  15
    Element Should Be Visible           ${MESSAGE_EMAIL_ERROR}
    ${error_message}                    Get Text                        ${MESSAGE_EMAIL_ERROR}
    Should Be Equal As Strings          ${error_message}                An account using this email address has already been registered. Please enter a valid password or request a new one.
