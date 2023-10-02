*** Settings ***
Resource        ../Page/BankBookEditorPage.robot
Resource        ../Page/UploadDocumentPage.robot
Resource        ../Page/CommonPage.robot
Resource        ../Resourses/TestData/${env}/config.robot

*** Keywords ***
Preview And Edit Book Bank OCR
    [Arguments]    ${language1}    ${language2}
    Select Language For BookBank And Verify The Field    ${language1}
    Select Language For BookBank And Verify The Field    ${language2}
    Click Submit Button On editor Page
    Check The Status Change To Complete
    Click Download Excel
    Sleep    10s