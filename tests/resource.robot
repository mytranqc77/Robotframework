*** Settings ***
Documentation    A resource file with reusable keywords and variables
...                 The system specific keyword created here form our own
...                 domain specific language. They utilize keywords provided
...                 by the imported SeleniumLibrary
Library    SeleniumLibrary
*** Variables ***
${user_name}           rahulshettyacademy
${invalid_user_name}    mitest
${invalid_password}    Test!234
${valid_password}    learning
${url}                 https://rahulshettyacademy.com/loginpagePractise/
*** Keywords ***
Open the browser with the Mortgage payment url
    Open Browser    about:blank    chrome
    Go To    ${url}

Close browser session
    Close Browser