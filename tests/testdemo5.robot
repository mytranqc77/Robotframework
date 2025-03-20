*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library    DataDriver    file=resources/data.csv    encoding=utf_8    dialect=unix
Resource    ../PageObjects/generic.robot

Test Setup    Open the browser with the Mortgage payment url
Test Template    Validate UnSuccessful Login
Test Teardown    Close Browser

*** Variables ***
${Error_message_login}    css:.alert-danger
${special_character}      %^&}test


*** Test Cases ***

*** Keywords ***
Validate UnSuccessful Login
    [Arguments]    ${username}    ${password}
    Log To Console    Username: ${username}, Password: ${password}
    Fill the login Form    ${username}    ${password}
    Wait until it checks and display error message
    Verify error message is correct

Fill the login form
    [Arguments]        ${username}        ${password}
    Wait Until Element Is Visible    id:username
    Wait Until Element Is Visible    id:password
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

Wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_message_login}    timeout=10s

Verify error message is correct
#    ${result}=    Get Text    ${Error_message_login}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_message_login}    Incorrect username/password.

