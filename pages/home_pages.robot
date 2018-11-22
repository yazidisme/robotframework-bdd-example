*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${IG_LOGO}            //a[@href='/']
${PROFILE_ICON}       //a[@href='/yazid_akun_testing/']
${PROFILE_BUTTON}     //a[text()='Profile']

*** Keywords ***
Home Page Opened
  Wait Until Element Is Visible    ${IG_LOGO}
  Wait Until Element Is Visible    ${PROFILE_ICON}
  Wait Until Element Is Visible    ${PROFILE_BUTTON}
