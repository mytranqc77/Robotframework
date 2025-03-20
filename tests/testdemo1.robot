*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Test Teardown    Close Browser
*** Variables ***
${Error_message_login}    css:.alert-danger
${user_name}    mimitesttest
${password}    12345i0
*** Test Cases ***
Validate UnSuccesful Login
    open the browser with the Mortgage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Open Browser    about:blank    chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    Wait Until Element Is Visible    id:username    5s
    Input Text    id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn
    
wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_message_login}    timeout=5s

verify error message is correct
#    ${result}=    Get Text    ${Error_message_login}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_message_login}    Incorrect username/password.


