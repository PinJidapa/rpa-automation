*** Settings ***
Resource     ../Resourses/Imports.robot
Resource     ../Keywords/LoginKeyword.robot
Resource    ../Keywords/UploadDocumentKeyword.robot
Resource    ../Keywords/TruckRegisEditorKeyword.robot
Resource    ../Resourses/TestData/${env}/UserLogin.robot
Library     ../Scripts/functions.py

*** Test Cases ***
TS-001 Verify Upload Document Page
    Open Browser And Sign In With Username And Password
    ...    ${username1}
    ...    ${password1}
    Upload Document On Document Page
    ...    Truck Registration Document OCR - Registration Page
    ...    Truck Registration Document OCR - Registration Page
    Preview And Edit Truck Registration OCR Then Check Excel File    "EN"    "TH"