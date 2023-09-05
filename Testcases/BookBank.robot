*** Settings ***
Resource     ../Resourses/Imports.robot
Resource     ../Keywords/LoginKeyword.robot
Resource    ../Keywords/UploadDocumentKeyword.robot
Resource    ../Keywords/BankBookEditorKeyword.robot
Resource    ../Resourses/TestData/${env}/UserLogin.robot

*** Test Cases ***
TS-001 Verify Upload Document Page
    Open Browser And Sign In With Username And Password
    ...    ${username1}
    ...    ${password1}
    Upload Document On Document Page
    ...    Bank book
    Verify Element In Book Bank Page
    Input Book Bank Detail