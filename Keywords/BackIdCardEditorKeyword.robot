*** Settings ***
Resource        ../Page/BackIdCardEditorPage.robot
Resource        ../Page/UploadDocumentPage.robot
Resource        ../Page/CommonPage.robot
Resource        ../Resourses/TestData/${env}/config.robot


*** Keywords ***
Preview And Edit Back Id Card OCR Then Check Excel File
    [Arguments]    ${language1}    ${language2}
    Select Language For BackIdCard And Verify The Field    ${language1}
    Select Language For BackIdCard And Verify The Field    ${language2}
    Click Submit Button On editor Page
    Check The Status Change To Complete
    Click Download Excel
    Check Back Id Card Excel File