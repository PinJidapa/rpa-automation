*** Settings ***
Resource        ../Page/BankBookEditorPage.robot
Resource        ../Page/UploadDocumentPage.robot
Resource        ../Page/CommonPage.robot
Resource        ../Resourses/TestData/${env}/config.robot

*** Keywords ***
Verify Element In Book Bank Page
    [Arguments]    ${language1}    ${language2}
    Select Language For BookBank And Verify The Field    ${language1}
    Select Language For BookBank And Verify The Field    ${language2}
    Click Submit Button On editor Page
    Check The Status Change To Complete