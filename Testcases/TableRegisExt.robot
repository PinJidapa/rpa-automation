*** Settings ***
Resource     ../Resourses/Imports.robot
Resource     ../Keywords/LoginKeyword.robot
Resource    ../Keywords/UploadDocumentKeyword.robot
Resource    ../Resourses/TestData/${env}/UserLogin.robot
Library     ../Scripts/functions.py
Resource    ../Page/CommonPage.robot

*** Test Cases ***
TS-001 Verify Upload Document Page
    Open Browser And Sign In With Username And Password
    ...    ${username1}
    ...    ${password1}
    Upload Document On Document Page
    ...    Table Information Extraction
    Click Many Save Button
    ...    8
    Click Submit Button On editor Page 
    Sleep    10s