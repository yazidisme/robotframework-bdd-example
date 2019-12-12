*** Settings ***
Resource          ../resources.robot
Resource          ../pages/login_pages.robot
Resource          ../pages/home_pages.robot
Test Setup        Open Login Page Using Chrome Browser
Test Teardown     Close Browser

*** Variables ***
${valid_username}       Yazid_Akun_Testing
${valid_password}       YOUR_VALID_PASSWORD
${invalid_data}         qwerty

*** Test Cases ***
Valid Login
  [Template]    Login with Valid Credentials
  # username   password
  ${valid_username}   ${valid_password}

Invalid Login
  [Template]    Login with Invalid Credentials
  # username   password
  ${valid_username}   ${invalid_data}
  ${invalid_data}   ${valid_password}
  ${invalid_data}   ${invalid_data}

*** Keywords ***
Login with Valid Credentials
  [Arguments]   ${username}   ${password}
  GIVEN Login Page Opened
  WHEN Input Username And Password    ${username}    ${password}
  THEN Home Page Opened

Login with Invalid Credentials
  [Arguments]   ${username}   ${password}
  GIVEN Login Page Opened
  WHEN Input Username And Password    ${username}    ${password}
  THEN Error Message Displayed

Input Username And Password
  [Arguments]   ${username}   ${password}
  Input Username                              ${username}
  Login Button Should Be Enabled
  Input Pass                                  ${password}
  Show Password Button Should Be Visible
  Click Login Button
