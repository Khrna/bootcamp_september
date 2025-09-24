*** Settings ***
Library    Browser
Resource   ../common.resource

*** Variables ***
${LOGIN_URL}         https://example.com/login
${USERNAME_FIELD}    css=#username
${PASSWORD_FIELD}    css=#password
${LOGIN_BUTTON}      css=button[type="submit"]
${SUCCESS_PAGE}      css=.dashboard-welcome
${ERROR_MESSAGE}     css=.error-message

*** Keywords ***
Navigate To Login Page
    Go To    ${LOGIN_URL}
    Wait For Elements State    ${USERNAME_FIELD}    visible    timeout=5s

Login To Application
    [Arguments]    ${username}    ${password}
    Fill Username    ${username}
    Fill Password    ${password}
    Click Submit
    
    # Race between success and error states
    ${status}=    Promise.race    timeout=5s
    ...    condition_1=Wait For Elements State    ${SUCCESS_PAGE}    visible
    ...    condition_2=Wait For Elements State    ${ERROR_MESSAGE}    visible
    
    [Return]    ${status}

Fill Username
    [Arguments]    ${username}
    Wait For Elements State    ${USERNAME_FIELD}    visible    timeout=5s
    Type Text    ${USERNAME_FIELD}    ${username}

Fill Password
    [Arguments]    ${password}
    Wait For Elements State    ${PASSWORD_FIELD}    visible    timeout=5s
    Type Text    ${PASSWORD_FIELD}    ${password}

Click Submit
    Wait For Elements State    ${LOGIN_BUTTON}    enabled    timeout=5s
    Click    ${LOGIN_BUTTON}

Verify Login Success
    Wait For Elements State    ${SUCCESS_PAGE}    visible    timeout=5s

Verify Login Error  
    Wait For Elements State    ${ERROR_MESSAGE}    visible    timeout=5s