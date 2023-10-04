*** Settings ***
Resource    ../Keywords/Utils.robot
Library     SeleniumLibrary

*** Variables ***
${submitButton}   //*[@id="result-panel"]/div[2]/div[2]

*** Keywords ***
Click Submit Button On editor Page 
    Run Until Keyword Succeed    Click Element   ${submitButton}

Click Submit Button Two Times
    Wait Until Element Is Enabled    ${submitButton}    10s
    Sleep    5s
    Run Until Keyword Succeed    Click Element   ${submitButton}
    Sleep    5s
    Wait Until Element Is Enabled    ${submitButton}    10s
    Sleep    5s
    Run Until Keyword Succeed    Click Element   ${submitButton}
    Wait Until Element Is Enabled    ${submitButton}    10s
    Sleep    5s
    Run Until Keyword Succeed    Click Element   ${submitButton}