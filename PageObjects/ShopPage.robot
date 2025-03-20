*** Settings ***
Documentation   All the page objects and keywords of landing page
Library     SeleniumLibrary
Library    Collections

*** Variables ***
${Shop_page_load}         css:.nav-link

*** Keywords ***
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
