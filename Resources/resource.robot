*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SINGINBUTTON}         xpath = //button[@tabindex='0']
${EMAILINPUT}       xpath = //*[@id='login']
${PASSWORDINPUT}        xpath = //*[@id='password']
${PAGELOGO}         xpath = //header/div/h6
${SINGOUTBUTTON}        xpath = //span[text()='Sign out']
${PANELLOGO}        xpath =//div[1]/h5



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
Click on the SingOut button
        Click Element       ${SINGOUTBUTTON}
Assert login page
        Wait Until Element Is Visible        ${PANELLOGO}
        Title Should Be     Scouts panel - sign in
        Capture Page Screenshot          alert.png