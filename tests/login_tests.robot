*** Settings ***
Resource          ../resources.robot
Resource          ../pages/login_pages.robot
Resource          ../pages/home_pages.robot

*** Variables ***
${valid_username}       yazid_akun_testing
${valid_password}       YOUR_VALID_PASSWORD
${invalid_data}         qwerty

*** Test Cases ***
Valid Login
  [Template]    Login with Valid Credentials
  ##username   password
  ${valid_username}   ${valid_password}

Invalid Login
  [Template]    Login with Invalid Credentials
  #username   password
  ${valid_username}   ${invalid_data}
  ${invalid_data}   ${valid_password}
  ${invalid_data}   ${invalid_data}

*** Keywords ***
Login with Valid Credentials
  [Arguments]   ${username}   ${password}
  GIVEN Open Browser To Login Page
  WHEN Input Username And Password    ${username}    ${password}
  THEN Login Success

Login with Invalid Credentials
  [Arguments]   ${username}   ${password}
  GIVEN Open Browser To Login Page
  WHEN Input Username And Password    ${username}    ${password}
  THEN Login Failed

Open Browser To Login Page
  Open Login Page Using Chrome Browser
  Login Page Opened

Input Username And Password
  [Arguments]   ${username}   ${password}
  Input Username                              ${username}
  Login Button Should Be Enabled
  Input Pass                                  ${password}
  Show Password Button Should Be Visible
  Click Login Button

Login Success
  Home Page Opened
  [Teardown]    Close Browser

Login Failed
  Error Message Displayed
  [Teardown]    Close Browser
