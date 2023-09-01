*** Settings ***
Resource    ../Keywords/Utils.robot
Library           SeleniumLibrary

*** Variables ***
${username}    //*[@name="username"]
${password}    //*[@name="password"]
${signInBtn}    //body/div[@id='root']/div[1]/div[1]/div[2]/div[1]/form[1]/button[1]

*** Keywords ***
Enter Username
    [Arguments]   ${value}
    Wait Until Element Is Visible    ${username}    10s
    Input Text    ${username}    ${value}

Enter Password
    [Arguments]   ${value}
    Wait Until Element Is Visible    ${password}    10s
    Input Text    ${password}    ${value}

Click Sign In Button
    Run Until Keyword Succeed    Click Element    ${signInBtn}
    