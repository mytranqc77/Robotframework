*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library    Collections
Test Setup    open the browser with the Mortgage payment url
Test Teardown    close browser session
Resource    resource.robot


*** Variables ***
${Error_message_login}    css:.alert-danger
${Shop_page_load}         css:.nav-link


*** Test Cases ***
Validate UnSuccessful Login
    Fill the login Form    ${username}    ${invalid_password}
    Wait for element to appear    ${Error_message_login}
    Verify error message is correct


Validate cards display in the shopping page
    Fill the login form    ${username}    ${valid_password}
    Wait for element to appear    ${Shop_page_load}
    Verify Card titles in the Shop page
    Select the Card    Nokia Edge

Log in with selected drop-down value
    Fill the login details and login page



*** Keywords ***
Fill the login form
    [Arguments]    ${user_name}    ${password}
    Wait Until Element Is Visible    id:username    timeout=5s
    Input Text    id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

Wait for element to appear
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify error message is correct
    Element Text Should Be    ${Error_message_login}    Incorrect username/password.

Verify Card titles in the Shop page
    @{expected_list}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${product_elements}=    Get Webelements    css:.card-title
    @{actual_list}=    Create List
    FOR    ${element}    IN    @{product_elements}
        Log    ${element.text}
        Append To List    ${actual_list}    ${element.text}
    END
    Lists Should Be Equal    ${actual_list}    ${expected_list}

Select the Card
    [Arguments]    ${Cardname}
    ${elements}=    Get Webelements    css:.card-title
    ${index}=    Set Variable    0
    FOR    ${element}    IN     @{elements}
        ${text}=    Get Text    ${element}
        Exit For Loop If    '${text}' == '${Cardname}'
        ${index}=    Evaluate    ${index}+1
    END
#    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    ${buttons}=    Get Webelements    css:.btn-info
    Click Button    ${buttons}[${index}]
    Sleep    5s

Fill the login details and login page
#    Set Selenium Timeout    10s
    Input Text    id:username    ${user_name}
    Input Password    id:password    learning
    Click Element    css:input[value="user"] + .checkmark
    Wait Until Element Is Visible    css:.modal-body
    Sleep    1s
    Click Element    id:okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms

