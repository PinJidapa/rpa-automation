*** Settings ***
Resource    ../Keywords/Utils.robot
Library     SeleniumLibrary

*** Variables ***
${saveButton}    //*[@id="extraction-save-page"]
${submitButton}   //*[@id="result-panel"]/div[2]/div[2]

*** Keywords ***
Click Submit Button On editor Page 
    Sleep    2s
    Wait Until Element Is Visible    ${submitButton}
    Run Until Keyword Succeed    Click Element   ${submitButton}

Click Many Save Button
    [Arguments]    ${times}
    Wait Until Element Is Visible    ${saveButton}    60s    
    Sleep    7s
    FOR    ${index}    IN RANGE    ${times}
        Run Until Keyword Succeed    Click Element    ${saveButton}
        Log To Console    1
    END