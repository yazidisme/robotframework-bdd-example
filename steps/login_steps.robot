*** Settings ***
Resource          ../pages/login_pages.robot

*** Keywords ***
Input Username And Password
  [Arguments]   ${username}   ${password}
  Input Username                              ${username}
  Input Pass                                  ${password}
  Show Password Button Should Be Visible
  Login Button Should Be Enabled
  Click Login Button
