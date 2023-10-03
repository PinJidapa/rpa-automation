*** Settings ***
Library     SeleniumLibrary
Resource    ../Page/UploadDocumentPage.robot

*** Keywords ***
Upload Document On Document Page
    [Arguments]    ${documentType}    ${value}
    Verify Document Page
    Select Document Type     ${documentType}
    Upload Document File    ${value}
    Click Submit Button
    Click Review The Document


