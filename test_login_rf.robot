*** Settings ***

Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***

${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SINGINBUTTON}         xpath = //button[@tabindex='0']
${EMAILINPUT}       xpath = //*[@id='login']
${PASSWORDINPUT}        xpath = //*[@id='password']
${PAGELOGO}         xpath = //header/div/h6


*** Test Cases ***
Log in to the system
    Open login page
    Type in mail
    Type in password
    Click om the submit button
    Assert dashboared
    [Teardown]    Close Browser
