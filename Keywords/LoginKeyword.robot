*** Settings ***
Resource        ../Page/LoginPage.robot
Resource        ../Resourses/TestData/${env}/config.robot

*** Keywords ***
Open Browser And Sign In With Username And Password
    [Arguments]    ${username}    ${password}
    Open Browser    ${url}    chrome
    Set Window Position    0    0
    Maximize Browser Window
    Enter Username    ${username}
    Enter Password    ${password}
    Click Sign In Button