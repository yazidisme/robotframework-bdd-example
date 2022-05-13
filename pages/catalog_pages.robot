*** Settings ***
Library         SeleniumLibrary
Library         String

*** Variables ***
${NAV_LINK_DRESSES}             (//*[@id="block_top_menu"]//a[text()="Dresses"])[2]
${NAV_LINK_EVENING_DRESSES}     (//*[@id="block_top_menu"]//a[text()="Evening Dresses"])[2]
${FILTER_COLOR_BEIGE}           id:layered_id_attribute_group_7
${FILTER_COLOR_PINK}            id:layered_id_attribute_group_24
${FIRST_PRODUCT}                (//*[contains(@class, "product-container")])[1]

*** Keywords ***
Click On Evening Dresses
    Wait Until Element Is Visible   ${NAV_LINK_DRESSES}
    Element Should Be Visible       ${NAV_LINK_DRESSES}
    Click Element                   ${NAV_LINK_DRESSES}
    Wait Until Element Is Visible   ${NAV_LINK_DRESSES}
    Element Should Be Visible       ${NAV_LINK_DRESSES}
    Mouse Over                      ${NAV_LINK_DRESSES}
    Wait Until Element Is Visible   ${NAV_LINK_EVENING_DRESSES}
    Element Should Be Visible       ${NAV_LINK_EVENING_DRESSES}
    Click Element                   ${NAV_LINK_EVENING_DRESSES}

Filter By Color
    [Arguments]         ${color}
    ${COLOR_UPPER}      Convert To Uppercase    ${color}
    Click Element       ${FILTER_COLOR_${COLOR_UPPER}}

Select First Product
    Click Element       ${FIRST_PRODUCT}
