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
${ADDPLAYERBUTTON}      xpath = //span[contains(text(),'Add player')]
${NAME}      xpath = //input[@name = 'name']
${SURENAME}      xpath = //input[@name = 'surname']
${AGE}      xpath = //input[@type = 'date']
${MAINPOSITION}      xpath = //input[@name = 'mainPosition']
${ADDAPLAYERBUTTON}         xpath = //button[@type = 'submit']


*** Test Cases ***

Add a player button
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboared
    [Timeout]
    Click on the Add a player button
    Fill in inputs
    Click on the Submit button 1
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
Click on the Add a player button
        Click Element       ${ADDPLAYERBUTTON}
        Sleep       3
        Title Should Be     Add player

Fill in inputs
        Input Text      ${NAME}     TestName
        Input Text      ${SURENAME}     TestSurename
        Input Text      ${AGE}     15.12.1989
        Input Text      ${MAINPOSITION}         Some
Click on the Submit button 1
        Click Button    ${ADDAPLAYERBUTTON}
        Sleep       5
        Capture Page Screenshot          alert.png
