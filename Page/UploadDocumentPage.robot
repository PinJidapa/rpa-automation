*** Settings ***
Resource    ../Keywords/Utils.robot
Library     SeleniumLibrary

*** Variables ***
${DocumentLabel}    //h6[contains(text(),'Upload Documents')]
${SelectDocumentTypeLable}    //h6[contains(text(),'Select document type')]
${SelectDocumentTypeDropDown}    //input[@id=':r0:']
${SubmitBtn}    //body/div[@id='root']/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/button[1]
${UploadArea}    //body/div[@id='root']/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/input[1]

*** Keywords ***
Verify Document Page
    Wait Until Element Is Visible    ${DocumentLabel}
    Wait Until Element Is Visible    ${SelectDocumentTypeLable}
    Wait Until Element Is Visible    ${SelectDocumentTypeDropDown}
    Wait Until Element Is Visible    ${SubmitBtn}

Select Document Type
    [Arguments]   ${value}
    Select From List By Value    ${SelectDocumentTypeDropDown}   ${value}

Upload Document File
    Choose File    ${UploadArea}      ${EXECDIR}/Resources/TestData/bookbank/bookbank1.jpg

    # Run Keyword And Ignore Error    Scroll Element Into View    ${inputBookBank}
    # Choose File    ${inputBookBank}    ${EXECDIR}/Resources/Assets/bankbook.png