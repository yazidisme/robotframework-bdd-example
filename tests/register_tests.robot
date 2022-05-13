*** Settings ***
Resource          ../resources.robot
Resource          ../steps/sign_in_steps.robot
Test Setup        Open Sign In Page Using Chrome Browser
Test Teardown     Close Browser

*** Variables ***
${genre}                Mrs.
${first_name}           Soledad
${last_name}            Garro
${password}             S0led4dG4rr0
${birth}                1/12/1992
${newsletter}           ${TRUE}
${offers}               ${TRUE}
${company}              Orbis
${address}              Ferroviarios Argentinos 336
${address2}             Pedro Vargas 1032
${city}                 Los Angeles
${state}                California
${zip}                  55000
${country}              United States
${additional_info}      -
${phone}                +542614319521
${mobile}               +542612535890
${alias}                home
${invalid_email}        solanabasle@gmail
${existing_email}       solabanabasle+test@gmail.com
&{valid_data}=          title=${genre}  first_name=${first_name}   last_name=${last_name}   password=${password}   birth=${birth}    newsletter=${newsletter}    offers=${offers}    address_first_name=${first_name}    address_last_name=${last_name}  company=${company}   address=${address}     address2=${address2}    city=${city}    state=${state}  zip=${zip}  country=${country}  additional_info=${additional_info}  phone=${phone}  mobile=${mobile}    alias=${alias}
#${email}               ${existing_email}

*** Test Cases ***
The User Registers Inputting Valid Data
    ${email}    Create Email Address
    GIVEN The User Has Opened Sign In Page
    WHEN The User Inputs Email Address      ${email}
    THEN Create An Account Button Should Be Enabled
    AND The User Clicks On Create An Account Button
    THEN The User Visualizes Create An Account Page Correctly
    WHEN The User Fills All Data Fields     ${email}    ${valid_data}
    AND The User Clicks On Register Button
    THEN The User Visualizes My Account Page Correctly

The User Tries To Register Inputting Invalid Data
    GIVEN The User Has Opened Sign In Page
    AND The User Clicks On Create An Account Button
    THEN The User Visualizes Invalid Email Address Error Message
    WHEN The User Inputs Email Address      ${invalid_email}
    THEN The User Visualizes Invalid Email Address Error Message

The User Tries To Register With An Existing Email
    GIVEN The User Has Opened Sign In Page
    WHEN The User Inputs Email Address      ${existing_email}
    AND The User Clicks On Create An Account Button
    THEN The User Visualizes Already Registered Account Error Message
