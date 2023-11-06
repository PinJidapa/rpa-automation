*** Settings ***
Resource    ../Page/LanguagePage.robot
Library           SeleniumLibrary
Library     ../Scripts/functions.py

*** Variables ***


*** Keywords ***

Select Language For Back Id Card And Verify The Field
    [Arguments]    ${lang}
    IF    ${lang} == "TH"
        Verify Table TH
        Edit Table TH
    ELSE 
        Verify Table EN
        Edit Table EN
    END

Verify Table TH
    Select Thai Language
    Wait Until Element Is Visible    ${backIdTitle}
    Wait Until Element Is Visible    ${laserCodeTH}

Verify Table EN
    Select Eng Language
    Wait Until Element Is Visible    ${backIdTitle}   
    Wait Until Element Is Visible    ${laserCodeEN}     

Edit Table TH
    Input Text    ${laserCodeFieldTH}      Testเลขหลังบัตร-01234

Edit Table EN
    Input Text    ${laserCodeFieldEN}      Testเลขหลังบัตร-01234