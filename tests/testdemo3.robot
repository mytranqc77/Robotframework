*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library    Collections
Library    String
Test Setup    open the browser with the Mortgage payment url
Test Teardown    close browser session
Resource    resource.robot


*** Variables ***
${selected_email}    None


*** Test Cases ***
Valivate child windown functionality
    Select the link of child windown
    Verify the user is switched to the child windown
    Grab the email id in the child windown
    Switch to parent windown and enter the email


*** Keywords ***
Select the link of child windown
    Click Element    css:.blinkingText
    Sleep            5s
    
Verify the user is switched to the child windown
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST
    
Grab the email id in the child windown
    ${full_header_text}=    Get Text    css:.red
    @{word}=                Split String    ${full_header_text}    at
    ${text_split}=   Get From List    ${word}    1
    Log    ${text_split}
    @{words_2}=    Split String    ${text_split}
    ${selected_email}=    Get From List    ${words_2}    0
    Log    ${selected_email}
    Set Global Variable    ${selected_email}

Switch to parent windown and enter the email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${selected_email}
    Sleep    5s


