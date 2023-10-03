*** Settings ***
Resource     ../Resourses/Imports.robot
Resource     ../Keywords/LoginKeyword.robot
Resource    ../Keywords/UploadDocumentKeyword.robot
Resource    ../Keywords/BankBookEditorKeyword.robot
Resource    ../Resourses/TestData/${env}/UserLogin.robot
Library     ../Scripts/functions.py

*** Test Cases ***
TS-001 Verify Upload Document Page
    Open Browser And Sign In With Username And Password
    ...    ${username1}
    ...    ${password1}
    Upload Document On Document Page
    ...    Bank book
    Preview And Edit Book Bank OCR    "EN"    "TH"
   ${correctDataList}=     Create List
    ...    {"รหัสสาขา": "Thปิ่น-_-1234$#;>?","ชื่อธนาคาร (ภาษาอังกฤษ)": ";>?Thนภ-_-1234$#","ชื่อธนาคาร (ภาษาไทย)": "ธนาคารไทยพาณิชย์","ชื่อสาขา (ภาษาอังกฤษ)": None,"ชื่อสาขา (ภาษาไทย)": None,"ชื่อบัญชี (ภาษาอังกฤษ)": ";>?Enนภ-_-1234$#","ชื่อบัญชี (ภาษาไทย)": None,"เลขที่บัญชี": "962-240326-4","ประเภทบัญชี (ภาษาอังกฤษ)": None,"ประเภทบัญชี (ภาษาไทย)": None,"รหัสธนาคาร": "SCB" }
    ${compare}    functions.compare     ${correctDataList}    ${EXECDIR}/assets/bookbank1.xlsx
    Should Be True    ${compare}
