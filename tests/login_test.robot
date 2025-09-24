*** Settings ***
Resource    ../resources/keywords/login_page.resource
Resource    ../resources/variables/test_data.resource

*** Test Cases ***
Successful Login Test
    Open Login Page
    Input Username    ${VALID_USERNAME}
    Input Password    ${VALID_PASSWORD}
    Click Submit Button
    Verify Successful Login

Invalid Username Login Test
    Open Login Page
    Input Username    incorrectUser
    Input Password    ${VALID_PASSWORD}
    Click Submit Button
    Verify Error Message    Your username is invalid!

Invalid Password Login Test
    Open Login Page
    Input Username    ${VALID_USERNAME}
    Input Password    incorrectPassword
    Click Submit Button
    Verify Error Message    Your password is invalid!

Empty Username Login Test
    Open Login Page
    Input Username    ${EMPTY}
    Input Password    ${VALID_PASSWORD}
    Click Submit Button
    Verify Error Message    Your username is invalid!

Empty Password Login Test
    Open Login Page
    Input Username    ${VALID_USERNAME}
    Input Password    ${EMPTY}
    Click Submit Button
    Verify Error Message    Your password is invalid!