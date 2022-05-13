*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${MAIN_PAGE}                http://automationpractice.com/index.php
${SIGN_IN_PAGE}             ${MAIN_PAGE}?controller=authentication&back=my-account
${CREATE_ACCOUNT_PAGE}      ${SIGN_IN_PAGE}\#account-creation

*** Keywords ***
Open Main Page Using Chrome Browser
  Open Browser    ${MAIN_PAGE}    Chrome
  Maximize Browser Window

Open Sign In Page Using Chrome Browser
  Open Browser    ${SIGN_IN_PAGE}   Chrome
  Maximize Browser Window
