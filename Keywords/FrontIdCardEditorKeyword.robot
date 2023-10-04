*** Settings ***
Resource        ../Page/FrontIdCardPage.robot
Resource        ../Page/UploadDocumentPage.robot
Resource        ../Page/CommonPage.robot
Resource        ../Resourses/TestData/${env}/config.robot


*** Keywords ***
Preview And Edit Truck Registration OCR Then Check Excel File
    # [Arguments]    ${language1}    ${language2}
    # Select Language For Truck Registration And Verify The Field    ${language1}
    # Select Language For Truck Registration And Verify The Field    ${language2}
    # Click Submit Button Two Times
    # Check The Status Change To Complete
    Click Download Excel
    Check The Truck Registration Excel File

