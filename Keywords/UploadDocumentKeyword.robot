*** Settings ***
Library     SeleniumLibrary
Resource    ../Page/UploadDocumentPage.robot

*** Keywords ***
Upload Document On Document Page
    Verify Document Page
    Select Document Type     Bank book
    Upload Document File

