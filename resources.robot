*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${MAIN_PAGE}      https://www.instagram.com
${LOGIN_PAGE}     ${MAIN_PAGE}/accounts/login/

*** Keywords ***
Open Main Page Using Chrome Browser
  Open Browser    ${MAIN_PAGE}    Chrome
  Maximize Browser Window

Open Login Page Using Chrome Browser
  Open Browser    ${LOGIN_PAGE}   Chrome
  Maximize Browser Window
