*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${LINK_FIRST_ORDER}             (//*[contains(@class, "first_item")]//a)[1]
${DETAIL_FIRST_PRODUCT}         //*[@id="order-detail-content"]/table/tbody/tr[1]/td[2]
${DETAIL_SECOND_PRODUCT}        //*[@id="order-detail-content"]/table/tbody/tr[2]/td[2]

*** Keywords ***
Verify Order Details
    [Arguments]                     ${color1}   ${size1}    ${color2}   ${size2}
    Wait Until Element Is Visible   ${LINK_FIRST_ORDER}         15
    Element Should Be Visible       ${LINK_FIRST_ORDER}
    Click Element                   ${LINK_FIRST_ORDER}
    Wait Until Element Is Visible   ${DETAIL_FIRST_PRODUCT}     15
    Element Should Be Visible       ${DETAIL_FIRST_PRODUCT}
    ${product1}                     Get Text                    ${DETAIL_FIRST_PRODUCT}
    Should Contain Any              ${product1}                 ${color1}               ${size1}
    Wait Until Element Is Visible   ${DETAIL_SECOND_PRODUCT}    15
    Element Should Be Visible       ${DETAIL_SECOND_PRODUCT}
    ${product1}                     Get Text                    ${DETAIL_SECOND_PRODUCT}
    Should Contain Any              ${product1}                 ${color2}               ${size2}
