*** Settings ***
Documentation   All the page objects and keywords of landing page
Library     SeleniumLibrary
Resource    generic.robot

*** Keywords ***

Fill the login form
    [Arguments]    ${user_name}    ${password}
    Wait Until Element Is Visible    id:username    timeout=5s
    Input Text    id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

Fill the login details and login page
#    Set Selenium Timeout    10s
    Input Text    id:username    ${user_name}
    Input Password    id:password    learning
    Click Element    css:input[value="user"] + .checkmark
    Wait Until Element Is Visible    css:.modal-body
    Sleep    2s
    Click Element    id:okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms
    Click Button    id:signInBtn