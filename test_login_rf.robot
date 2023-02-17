*** Settings ***

Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website
Resource        Resources/resource.robot

*** Test Cases ***

Log in to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboared
    [Teardown]  Close Browser



