*** Settings ***
Documentation   All the PageObjects and keywords of landing page
Library     SeleniumLibrary
Library    Collections
Resource    generic.robot

*** Variables ***
${Shop_page_load}         css:.nav-link
${country_name}    India

*** Keywords ***
Enter the country and select the term
    [Arguments]    ${country_name}
    Input Text    country    ${country_name}
    Sleep    5s
    generic.Wait for element to appear    //a[text()="${country_name}"]
    Click Element    //a[text()="${country_name}"]
    Click Element    css:.checkbox label

ConfirmationPage.Purchase product and confirmation
    Click Element    css:.btn-success
    Page Should Contain    Success!


