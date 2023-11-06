*** Settings ***
Resource    ../Keywords/Utils.robot
Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${documentLabel}    //h6[contains(text(),'Upload Documents')]
${selectDocumentTypeLable}    //h6[contains(text(),'Select document type')]
${selectDocumentInput}   //*[@id="document-autocomplete"]
${submitBtn}    //*[@id="document-submit"]
${uploadArea}    //*[@id="document-upload"]/input
${documentInputDropDown}    //*[@id="document-autocomplete"]
${loadingIcon}     //*[@id="table-component"]/tbody/tr[1]/td[6]/div/span/svg
${firstEditButton}    //tbody/tr[1]/td[7]/div[1]/button[1]
${optionButton}    //tbody/tr[1]/td[7]/div[1]/button[2]/*[1]
${tableFirstRow}    //table[@id='table-component']//tbody/tr[1]/td[6]
${tableThirdRow}    //table[@id='table-component']//tbody/tr[3]
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
    Press Keys    ${selectDocumentInput}    ARROW_DOWN     ENTER    15s

Upload Document File
    [Arguments]   ${value}
    Run Keyword If    "${value}" == "Bank book"
    ...        Upload Book Bank Document File
    ...    ELSE IF    "${value}" == "Truck Registration Document OCR - Registration Page"
    ...        Upload Truck Registration Document File
    ...    ELSE IF    "${value}" == "Thailand ID Card OCR - Back"
    ...        Upload Back Id Card Document File
        
Upload Book Bank Document File
    Choose File    ${UploadArea}      ${EXECDIR}/Resourses/TestData/bookBank/bookbank1.jpg

Upload Truck Registration Document File
    Choose File    ${UploadArea}      ${EXECDIR}/Resourses/TestData/truckRegis/truckRegist1.jpg

Upload Back Id Card Document File
    Choose File    ${UploadArea}      ${EXECDIR}/Resourses/TestData/backIdCard/thai_id_back.jpg   

Click Submit Button
    Run Until Keyword Succeed  Click Element    ${SubmitBtn}
    
Click Review The Document
    Scroll Element Into View    ${tableThirdRow}
    ${elem}=    Get Text    ${tableFirstRow}
    WHILE  '${elem}' != 'In progress'
        ${elem}=    Get Text    ${tableFirstRow}
    END

    Wait Until Page Contains    ${elem}
    Wait Until Element Is Enabled    ${FirstEditButton}    30s
    Click Element    ${FirstEditButton}

Check The Status Change To Complete
    Sleep    5s
    ${elem}=    Get Text    ${tableFirstRow}
    WHILE  '${elem}' != 'Completed'
        ${elem}=    Get Text    ${tableFirstRow}
    END
    Wait Until Page Contains    ${elem}
  
Click Download Excel
    Scroll Element Into View    ${tableThirdRow}
    Wait Until Element Is Enabled    ${optionButton}    30s
    Click Element    ${optionButton}
    Run Until Keyword Succeed  Click Element    ${downloadToExcelButton}
    Sleep    10s