*** Settings ***
Resource        ../Page/BankBookEditorPage.robot
Resource        ../Page/UploadDocumentPage.robot
Resource        ../Page/CommonPage.robot
Resource        ../Resourses/TestData/${env}/config.robot

*** Keywords ***
Verify Element In Book Bank Page
    [Arguments]    ${language}
    Select Language For BookBank And Verify The Field    ${language}
    Click Submit Button On editor Page
    Check The Status Change To Complete