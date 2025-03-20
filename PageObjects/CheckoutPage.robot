*** Settings ***
Documentation   All the PageObjects and keywords of landing page
Library     SeleniumLibrary
#Resource    generic.robot

*** Variables ***
${Shop_page_load}         css:.nav-link

*** Keywords ***
Verify items in the checkout page and proceed
    Click Element    css:.btn-success