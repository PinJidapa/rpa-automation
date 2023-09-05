*** Settings ***
Library     SeleniumLibrary
Resource    ../Page/UploadDocumentPage.robot

*** Keywords ***
Upload Document On Document Page
    [Arguments]    ${documentType}
    Verify Document Page
    Select Document Type     ${documentType}
    Upload Document File
    Click Submit Button
    Click Review The Document


