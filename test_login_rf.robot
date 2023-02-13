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
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboared
    [Teardown]  Close Browser

*** Keywords ***

Open login page
        Open Browser        ${LOGIN URL}    ${BROWSER}
        Title Should Be     Scouts panel - sign in
Type in email
        Input Text  ${EMAILINPUT}           user07@getnada.com
Type in password
        Input Password    ${PASSWORDINPUT}      Test-1234
Click on the Submit button
        Click Button    ${SINGINBUTTON}
Assert dashboared
        Wait Until Element Is Visible        ${PAGELOGO}
        Title Should Be          Scouts panel
        Capture Page Screenshot          alert.png


