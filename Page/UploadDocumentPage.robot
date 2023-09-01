*** Settings ***
Resource    ../Keywords/Utils.robot
Library     SeleniumLibrary

*** Variables ***
${DocumentLabel}    //h6[contains(text(),'Upload Documents')]
${SelectDocumentTypeLable}    //h6[contains(text(),'Select document type')]
${SelectDocumentTypeDropDown}    //*[@id="document-autocomplete"]
${SubmitBtn}    //body/div[@id='root']/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/button[1]
${UploadArea}    //body/div[@id='root']/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/input[1]
${DocumentInputDropDown}    //*[@id="root"]/div[2]/div[2]/div/div/div[1]/div/div[1]/div[1]/div/div/div/div/button
*** Keywords ***
Verify Document Page
    Wait Until Element Is Visible    ${DocumentLabel}    15s
    Wait Until Element Is Visible    ${SelectDocumentTypeLable}    15s
    Wait Until Element Is Visible    ${SubmitBtn}    15s

Select Document Type
    [Arguments]   ${value}
    Wait Until Element Is Visible    ${SelectDocumentTypeDropDown}    15s
    Wait Until Element Is Visible    ${DocumentInputDropDown}    15s
    Click Element    ${DocumentInputDropDown}
    Sleep    100
    Input Text   ${SelectDocumentTypeDropDown}    ${value}
    #Select From List By Value    ${SelectDocumentTypeDropDown}   ${value}

Upload Document File
    Choose File    ${UploadArea}      ${EXECDIR}/Resourses/TestData/bookBank/bookbank1.jpg
    Sleep     100
    # Run Keyword And Ignore Error    Scroll Element Into View    ${inputBookBank}
    # Choose File    ${inputBookBank}    ${EXECDIR}/Resources/Assets/bankbook.png