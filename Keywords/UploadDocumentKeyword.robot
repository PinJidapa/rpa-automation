*** Settings ***
Library     SeleniumLibrary
Resource    ../Page/UploadDocumentPage.robot

*** Keywords ***
Upload Document
    [Arguments]   ${DocumentType}
    Verify Document Page
    Select Document Type    ${DocumentType}
    Upload Document File

