*** Settings ***

Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website
Resource        Resources/resource.robot





*** Test Cases ***

Log out to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
#    Assert dashboared
    [Timeout]
    Sleep    3
    Click on the SingOut button
#    Assert login page
    [Teardown]  Close Browser



