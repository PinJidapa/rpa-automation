*** Settings ***
Resource    ../Keywords/Utils.robot
Library     SeleniumLibrary

*** Variables ***
${documentLabel}    //h6[contains(text(),'Upload Documents')]
${selectDocumentTypeLable}    //h6[contains(text(),'Select document type')]
${selectDocumentInput}   //*[@id="document-autocomplete"]
${submitBtn}    //*[@id="document-submit"]
${uploadArea}    //*[@id="document-upload"]/input
${documentInputDropDown}    //*[@id="document-autocomplete"]
${loadingIcon}     //*[@id="table-component"]/tbody/tr[1]/td[5]/div/span
${firstEditButton}    //tbody/tr[1]/td[6]/div[1]/button[1]
${editButton}    //tbody/tr[1]/td[6]/div[1]/button[2]/*[1]
${completeButton}        //tbody/tr[1]/td[5]/div[1]/*[1]
${downloadToExcelButton}    //p[contains(text(),'Download Excel')]


*** Keywords ***
Verify Document Page
    Wait Until Element Is Visible    ${documentLabel}    15s
    Wait Until Element Is Visible    ${selectDocumentTypeLable}    15s
    Wait Until Element Is Visible    ${submitBtn}    15s

Select Document Type
    [Arguments]   ${value}
    [Documentation]   Select Document Type
    Wait Until Element Is Visible    ${documentInputDropDown}    15s
    Wait Until Element Is Enabled    ${selectDocumentInput}    15s
    Input Text    ${selectDocumentInput}    ${value}
    Press Keys    ${selectDocumentInput}    ARROW_DOWN     ENTER

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

Check The Status Change To Complete
    # Run Keyword And Ignore Error    Scroll Element Into View    ${editButton}
    Wait Until Element Is Visible    ${completeButton}    10s
  
Click Download Excel
    Wait Until Element Is Enabled    ${editButton}    30s
    Click Element    ${editButton}
    Run Until Keyword Succeed  Click Element    ${downloadToExcelButton} 
    Sleep    10s
