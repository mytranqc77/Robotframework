*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library    Collections
Library    ../customerlibraries/shop.py
Test Setup    open the browser with the Mortgage payment url
Test Teardown    close browser session
Resource    resource.robot


*** Variables ***
${Error_message_login}    css:.alert-danger
${Shop_page_load}         css:.nav-link


*** Test Cases ***

Validate cards display in the shopping page
    Fill the login form    ${username}    ${valid_password}
    Wait for element to appear    ${Shop_page_load}
    Verify Card titles in the Shop page
    Add Items To Cart And Checkout    ${productslist}
    Log To Console    ${productslist}




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


Verify Card titles in the Shop page
    @{expected_list}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${product_elements}=    Get Webelements    css:.card-title
    @{actual_list}=    Create List
    FOR    ${element}    IN    @{product_elements}
        Log    ${element.text}
        Append To List    ${actual_list}    ${element.text}
    END
    Lists Should Be Equal    ${actual_list}    ${expected_list}






