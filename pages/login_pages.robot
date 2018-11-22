*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}             //input[@name='username']
${PASSWORD_FIELD}             //input[@name='password']
${LOGIN_BUTTON}               //button[@type='submit'][text()='Log in']
${SHOWPASSWORD_BUTTON}        //button[@type='button'][text()='Show']
${ERROR_MESSAGE}              //p[@id='slfErrorAlert']

*** Keywords ***
Login Page Opened
  Wait Until Element Is Visible     ${USERNAME_FIELD}
  Wait Until Element Is Visible     ${PASSWORD_FIELD}

Input Username
  [Arguments]                       ${username}
  Input Text                        ${USERNAME_FIELD}       ${username}

Login Button Should Be Enabled
  Wait Until Element Is Enabled     ${LOGIN_BUTTON}

Input Pass
  [Arguments]                       ${password}
  Input Text                        ${PASSWORD_FIELD}       ${password}

Show Password Button Should Be Visible
  Wait Until Element Is Visible     ${SHOWPASSWORD_BUTTON}

Click Login Button
  Click Element                     ${LOGIN_BUTTON}

Error Message Displayed
  Wait Until Element Is Visible     ${ERROR_MESSAGE}
