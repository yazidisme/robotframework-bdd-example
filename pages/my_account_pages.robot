*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${TITLE_MY_ACCOUNT}                 //*[@class="page-heading" and contains(., "My account")]

*** Keywords ***
Verify My Account Page Opened
    Wait Until Element Is Visible   ${TITLE_MY_ACCOUNT}     15
    Element Should Be Visible       ${TITLE_MY_ACCOUNT}
