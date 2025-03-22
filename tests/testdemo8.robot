*** Settings ***
Documentation   Perform API Testing
Library     SeleniumLibrary
Library    Collections
Library    BuiltIn
Library    RequestsLibrary

*** Variables ***
${base_url}    https://rahulshettyacademy.com
${book_id}    
${book_name}    tenbook2
${isbn}    daylaisbn2
${aisle}    89548982
${author}    daylaauthor2



*** Test Cases ***
TC01: Test Add book into library database
    [Tags]    API
    Add book into library database

TC02: Test Get the book details which got added
    [Tags]    API
    Get the book details which got added

TC03: Test Delete the book from database
    [Tags]    API
    Delete the book from database

*** Keywords ***
Add book into library database
    &{req_body}=    Create Dictionary    name=${book_name}    isbn=${isbn}    aisle=${aisle}    author=${author}
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
    Log To Console    ${response.json()}
#    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id}=    Get From Dictionary    ${response.json()}    ID
    Set Global Variable     ${book_id}    ${book_id}

    Log To Console    ${book_id}    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    Status Should Be    200    ${response}
    Log To Console    ${book_id}


Get the book details which got added
    ${get_response}=    GET    ${base_url}/Library/GetBook.php?    params=ID=${book_id}    expected_status=200
    Log     ${get_response.json()}
#    [{'book_name': 'hellomimiii', 'isbn': 'hellomimiii', 'aisle': '47864791', 'author': 'hellomimiii'}]
    Should Be Equal As Strings    ${book_name}    ${get_response.json()}[0][book_name]
    Log    ${get_response.json()}[0][book_name]

Delete the book from database
    &{request_body}=    Create Dictionary    ID=${book_id}
    ${delete_response}=    POST    ${base_url}/Library/DeleteBook.php    json=${request_body}    expected_status=200
    Should Be Equal As Strings    ${delete_response.json()}[msg]    book is successfully deleted


    




