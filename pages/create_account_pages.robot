*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${TITLE_CREATE_ACCOUNT}             //*[@class="page-heading" and contains(., "Create an account")]
${TITLE_PERSONAL_INFO}              //*[@class="page-subheading" and contains(., "Your personal information")]
${LABEL_TITLE}                      //label[contains(., "Title")]
${OPTION_MR}                        id:id_gender1
${OPTION_MRS}                       id:id_gender2
${LABEL_FIRST_NAME}                 //label[@for="customer_firstname"]
${INPUT_FIRST_NAME}                 id:customer_firstname
${LABEL_LAST_NAME}                  //label[@for="customer_lastname"]
${INPUT_LAST_NAME}                  id:customer_lastname
${LABEL_CREATE_EMAIL}               //label[@for="email"]
${INPUT_CREATE_EMAIL}               id:email
${LABEL_PASSWORD}                   //label[@for="passwd"]
${INPUT_PASSWORD}                   id:passwd
${LABEL_DATE_OF_BIRTH}              //label[contains(., "Date of Birth")]
${DROPDOWN_DAYS}                    id:days
${DROPDOWN_MONTHS}                  id:months
${DROPDOWN_YEARS}                   id:years
${DROPDOWN_DAYS_VISUAL}             id:uniform-days
${DROPDOWN_MONTHS_VISUAL}           id:uniform-months
${DROPDOWN_YEARS_VISUAL}            id:uniform-years
${LABEL_NEWSLETTER}                 //label[@for="newsletter"]
${CHECKBOX_NEWSLETTER}              id:newsletter
${CHECKBOX_NEWSLETTER_VISUAL}       id:uniform-newsletter
${LABEL_SPECIAL_OFFERS}             //label[@for="optin"]
${CHECKBOX_SPECIAL_OFFERS}          id:optin
${CHECKBOX_SPECIAL_OFFERS_VISUAL}   id:uniform-optin
${TITLE_ADDRESS}                    //*[@class="page-subheading" and contains(., "Your address")]
${LABEL_ADDRESS_FIRST_NAME}         //label[@for="firstname"]
${INPUT_ADDRESS_FIRST_NAME}         id:firstname
${LABEL_ADDRESS_LAST_NAME}          //label[@for="lastname"]
${INPUT_ADDRESS_LAST_NAME}          id:lastname
${LABEL_COMPANY}                    //label[@for="company"]
${INPUT_COMPANY}                    id:company
${LABEL_ADDRESS}                    //label[@for="address1"]
${INPUT_ADDRESS}                    id:address1
${LABEL_ADDRESS2}                   //label[@for="address2"]
${INPUT_ADDRESS2}                    id:address2
${LABEL_CITY}                       //label[@for="city"]
${INPUT_CITY}                       id:city
${LABEL_STATE}                      //label[@for="id_state"]
${DROPDOWN_STATE}                   id:id_state
${DROPDOWN_STATE_VISUAL}            id:uniform-id_state
${LABEL_ZIP}                        //label[@for="postcode"]
${INPUT_ZIP}                        id:postcode
${LABEL_COUNTRY}                    //label[@for="id_country"]
${DROPDOWN_COUNTRY}                 id:id_country
${DROPDOWN_COUNTRY_VISUAL}          id:uniform-id_country
${LABEL_ADDITIONAL_INFO}            //label[@for="other"]
${TEXTAREA_ADDITIONAL_INFO}         id:other
${LABEL_PHONE}                      //label[@for="phone"]
${INPUT_PHONE}                      id:phone
${LABEL_MOBILE}                     //label[@for="phone_mobile"]
${INPUT_MOBILE}                     id:phone_mobile
${LABEL_ADDRESS_ALIAS}              //label[@for="alias"]
${INPUT_ADDRESS_ALIAS}              id:alias
${BUTTON_REGISTER}                  id:submitAccount

@{VISUAL_FORM_ELEMENTS}=            ${TITLE_CREATE_ACCOUNT}     ${TITLE_PERSONAL_INFO}  ${LABEL_TITLE}  ${OPTION_MR}    ${OPTION_MRS}   ${LABEL_FIRST_NAME}     ${INPUT_FIRST_NAME}     ${LABEL_LAST_NAME}  ${INPUT_LAST_NAME}  ${LABEL_CREATE_EMAIL}  ${INPUT_CREATE_EMAIL}  ${LABEL_PASSWORD}   ${INPUT_PASSWORD}   ${LABEL_DATE_OF_BIRTH}  ${DROPDOWN_DAYS_VISUAL}    ${DROPDOWN_MONTHS_VISUAL}  ${DROPDOWN_YEARS_VISUAL}   ${LABEL_NEWSLETTER}     ${CHECKBOX_NEWSLETTER_VISUAL}  ${LABEL_SPECIAL_OFFERS}     ${CHECKBOX_SPECIAL_OFFERS_VISUAL}  ${TITLE_ADDRESS}    ${LABEL_ADDRESS_FIRST_NAME}     ${INPUT_ADDRESS_FIRST_NAME}     ${LABEL_ADDRESS_LAST_NAME}  ${INPUT_ADDRESS_LAST_NAME}  ${LABEL_COMPANY}    ${INPUT_COMPANY}    ${LABEL_ADDRESS}    ${INPUT_ADDRESS}    ${LABEL_ADDRESS2}   ${INPUT_ADDRESS2}   ${LABEL_CITY}   ${INPUT_CITY}   ${LABEL_STATE}  ${DROPDOWN_STATE_VISUAL}   ${LABEL_ZIP}    ${INPUT_ZIP}    ${LABEL_COUNTRY}    ${DROPDOWN_COUNTRY_VISUAL}     ${LABEL_ADDITIONAL_INFO}    ${TEXTAREA_ADDITIONAL_INFO}     ${LABEL_PHONE}  ${INPUT_PHONE}  ${LABEL_MOBILE}     ${INPUT_MOBILE}     ${LABEL_ADDRESS_ALIAS}  ${INPUT_ADDRESS_ALIAS}  ${BUTTON_REGISTER}

*** Keywords ***
Input field
    [Arguments]                       ${field}  ${value}
    Wait Until Element Is Enabled     ${field}
    Input Text                        ${field}  ${value}

Verify Create An Account Page Opened
    FOR     ${element}  IN  @{VISUAL_FORM_ELEMENTS}
        Wait Until Element Is Visible     ${element}    15
        Element Should Be Visible         ${element}
    END

Fill All Create Account Form Fields
    [Arguments]                     ${email}    ${data}
    IF  "${data.title}" == "Mr."
        Click Element               ${OPTION_MR}
    ELSE
        Click Element               ${OPTION_MRS}
    END

    Input Field                     ${INPUT_FIRST_NAME}             ${data.first_name}
    Input Field                     ${INPUT_LAST_NAME}              ${data.last_name}
    Input Field                     ${INPUT_CREATE_EMAIL}           ${email}
    Input Field                     ${INPUT_PASSWORD}               ${data.password}

    @{date_split}=  Split String    ${data.birth}   /
    Select From List By Value       ${DROPDOWN_DAYS}    ${date_split[0]}
    Select From List By Value       ${DROPDOWN_MONTHS}  ${date_split[1]}
    Select From List By Value       ${DROPDOWN_YEARS}   ${date_split[2]}

    IF  ${data.newsletter}
        Click Element               ${CHECKBOX_NEWSLETTER}
    END

    IF  ${data.offers}
        Click Element               ${CHECKBOX_SPECIAL_OFFERS}
    END

    Input Field                     ${INPUT_ADDRESS_FIRST_NAME}     ${data.address_first_name}
    Input Field                     ${INPUT_ADDRESS_LAST_NAME}      ${data.address_last_name}
    Input Field                     ${INPUT_COMPANY}                ${data.company}
    Input Field                     ${INPUT_ADDRESS}                ${data.address}
    Input Field                     ${INPUT_ADDRESS2}               ${data.address2}
    Input Field                     ${INPUT_CITY}                   ${data.city}
    Select From List By Label       ${DROPDOWN_STATE}               ${data.state}
    Input Field                     ${INPUT_ZIP}                    ${data.zip}
    Select From List By Label       ${DROPDOWN_COUNTRY}             ${data.country}
    Input Field                     ${TEXTAREA_ADDITIONAL_INFO}     ${data.additional_info}
    Input Field                     ${INPUT_PHONE}                  ${data.phone}
    Input Field                     ${INPUT_MOBILE}                 ${data.mobile}
    Input Field                     ${INPUT_ADDRESS_ALIAS}          ${data.alias}

Click On Register Button
    Click Element   ${BUTTON_REGISTER}
