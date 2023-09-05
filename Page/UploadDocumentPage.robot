*** Settings ***
Resource    ../Keywords/Utils.robot
Library     SeleniumLibrary

*** Variables ***
${DocumentLabel}    //h6[contains(text(),'Upload Documents')]
${SelectDocumentTypeLable}    //h6[contains(text(),'Select document type')]
${SelectDocumentInput}   //*[@id="document-autocomplete"]
${SubmitBtn}    //body/div[@id='root']/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/button[1]
${UploadArea}    //body/div[@id='root']/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/input[1]
${DocumentInputDropDown}    //*[@id="root"]/div[2]/div[2]/div/div/div[1]/div/div[1]/div[1]/div/div/div/div/button
${LoadingIcon}     //*[@id="table-component"]/tbody/tr[1]/td[5]/div/span
${FirstEditButton}    //tbody/tr[1]/td[6]/div[1]/button[1]


*** Keywords ***
Verify Document Page
    Wait Until Element Is Visible    ${DocumentLabel}    15s
    Wait Until Element Is Visible    ${SelectDocumentTypeLable}    15s
    Wait Until Element Is Visible    ${SubmitBtn}    15s

Select Document Type
    [Arguments]   ${value}
    [Documentation]   Select Document Type
    Wait Until Element Is Visible    ${DocumentInputDropDown}    15s
    Wait Until Element Is Visible    ${SelectDocumentInput}    15s
    Input Text    ${SelectDocumentInput}    ${value}
    Press Keys    ${SelectDocumentInput}    ARROW_DOWN     ENTER

Upload Document File
    Choose File    ${UploadArea}      ${EXECDIR}/Resourses/TestData/bookBank/bookbank1.jpg

Click Submit Button
    Run Until Keyword Succeed  Click Element    ${SubmitBtn}
    
Click Review The Document
    Sleep    2s
    Run Keyword And Ignore Error    Scroll Element Into View    ${LoadingIcon}
    Wait Until Element Is Visible    ${LoadingIcon}   10s
    Wait Until Element Is Enabled    ${FirstEditButton}    30s
    Click Element    ${FirstEditButton}


