*** Settings ***
Resource    ../Keywords/Utils.robot
Library     SeleniumLibrary

*** Variables ***
${DocumentLabel}    //h6[contains(text(),'Upload Documents')]
${SelectDocumentTypeLable}    //h6[contains(text(),'Select document type')]
${SelectDocumentTypeDropDown}    //*[@id="document-autocomplete"]
${SubmitBtn}    //body/div[@id='root']/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/button[1]
${UploadArea}    //body/div[@id='root']/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/input[1]

*** Keywords ***
Verify Document Page
    Wait Until Element Is Visible    ${DocumentLabel}    15s
    Wait Until Element Is Visible    ${SelectDocumentTypeLable}    15s
    Wait Until Element Is Visible    ${SubmitBtn}    15s

Select Document Type
    # [Arguments]   ${value}
    Wait Until Element Is Visible    ${SelectDocumentTypeDropDown}    15s
    Input Text Using JavaScript Id    document-autocomplete    hello
    Sleep     10
    #Select From List By Value    ${SelectDocumentTypeDropDown}   ${value}

Upload Document File
    Choose File    ${UploadArea}      ${EXECDIR}/Resources/TestData/bookbank/bookbank1.jpg
    # Run Keyword And Ignore Error    Scroll Element Into View    ${inputBookBank}
    # Choose File    ${inputBookBank}    ${EXECDIR}/Resources/Assets/bankbook.png