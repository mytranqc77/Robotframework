*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library    Collections
Library    BuiltIn
Library    RequestsLibrary

*** Variables ***
${base_url}    https://rahulshettyacademy.com
${book_id}

*** Test Cases ***
#Play around with dictionary
#    &{data}=    Create Dictionary    username=mitran    password=Test!234
#    Dictionary Should Contain Key    ${data}    username
#    Dictionary Should Contain Value    ${data}    mitran
##    Log To Console    ${data}
#    ${username_from_dic}=    Get From Dictionary    ${data}    username
#    ${key}=    Get Dictionary Keys    ${data}
#    Log To Console    ${username_from_dic}
#    Log To Console    ${key}

Add book into library database
    &{req_body}=    Create Dictionary    name=Testt    isbn=mii    aisle=8498592    author=testt
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
    Log To Console    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id}=    Get From Dictionary    ${response.json()}    ID
    Log To Console    ${book_id}    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    Status Should Be    200    ${response}
    Set Global Variable    ${book_id}

    


Get the book details which got added
    ${get_response}=    GET    ${base_url}/Library/Getbook.php    params=ID=${book_id}}    expected_status=200



    











    
    
    

    




#*** Keywords ***
#Fill the login form
#    [Arguments]    ${user_name}    ${password}
#    Wait Until Element Is Visible    id:username    timeout=5s
#    Input Text    id:username    ${user_name}
#    Input Password    id:password    ${password}
#    Click Button    id:signInBtn
#
#Wait for element to appear
#    [Arguments]    ${element}
#    Wait Until Element Is Visible    ${element}
#
#Verify error message is correct
#    Element Text Should Be    ${Error_message_login}    Incorrect username/password.
#
#Verify Card titles in the Shop page
#    @{expected_list}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
#    ${product_elements}=    Get Webelements    css:.card-title
#    @{actual_list}=    Create List
#    FOR    ${element}    IN    @{product_elements}
#        Log    ${element.text}
#        Append To List    ${actual_list}    ${element.text}
#    END
#    Lists Should Be Equal    ${actual_list}    ${expected_list}
#
#Select the Card
#    [Arguments]    ${Cardname}
#    ${elements}=    Get Webelements    css:.card-title
#    ${index}=    Set Variable    0
#    FOR    ${element}    IN     @{elements}
#        ${text}=    Get Text    ${element}
#        Exit For Loop If    '${text}' == '${Cardname}'
#        ${index}=    Evaluate    ${index}+1
#    END
##    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
#    ${buttons}=    Get Webelements    css:.btn-info
#    Click Button    ${buttons}[${index}]
#    Sleep    5s
#
#Fill the login details and login page
##    Set Selenium Timeout    10s
#    Input Text    id:username    ${user_name}
#    Input Password    id:password    learning
#    Click Element    css:input[value="user"] + .checkmark
#    Wait Until Element Is Visible    css:.modal-body
#    Sleep    1s
#    Click Element    id:okayBtn
#    Wait Until Element Is Not Visible    css:.modal-body
#    Select From List By Value    css:select.form-control    teach
#    Select Checkbox    id:terms
#    Checkbox Should Be Selected    id:terms



