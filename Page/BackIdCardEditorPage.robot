*** Settings ***
Resource    ../Page/LanguagePage.robot
Library           SeleniumLibrary
Library     ../Scripts/functions.py

*** Variables ***
#BackIdCard Title
${backIdTitle}    //p[contains(text(),'Thailand ID Card OCR - Back')]

#Thai
${laserCodeTH}    //p[contains(text(),'เลขหลังบัตร')]

#Eng
${laserCodeEN}    //p[contains(text(),'Laser Code')]


#Thai Field 
${laserCodeFieldTH}        //textarea[@data-label="เลขหลังบัตร"]
#Eng Field
${laserCodeFieldEN}    //textarea[@data-label="Laser Code"]

*** Keywords ***

Select Language For Back Id Card And Verify The Field
    [Arguments]    ${lang}
    IF    ${lang} == "TH"
        Verify The Field In Back Id Card TH
        Edit Back Id Card TH
    ELSE 
        Verify The Field In Back Id Card EN
        Edit Back Id Card EN
    END

Verify The Field In Back Id Card TH
    Select Thai Language
    Wait Until Element Is Visible    ${backIdTitle}
    Wait Until Element Is Visible    ${laserCodeTH}

Verify The Field In Back Id Card EN
    Select Eng Language
    Wait Until Element Is Visible    ${backIdTitle}   
    Wait Until Element Is Visible    ${laserCodeEN}     

Edit Back Id Card TH
    Input Text    ${laserCodeFieldTH}      Testเลขหลังบัตร-01234

Edit Back Id Card EN
    Input Text    ${laserCodeFieldEN}      Testเลขหลังบัตร-01234

Check Back Id Card Excel File
    ${correctDataList}=     Create List
    ...    {"เลขหลังบัตร": "Testเลขหลังบัตร-01234"}
    ${compare}    functions.compare     ${correctDataList}    ${EXECDIR}/assets/thai_id_back.xlsx
    Should Be True    ${compare}