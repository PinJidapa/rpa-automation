*** Settings ***
Resource    ../Keywords/Utils.robot
Library     SeleniumLibrary

*** Variables ***
${changeLanguageBtn}    //*[@id="extraction-language-changing"]
${thaiLnaguageBtn}    //*[@id="extraction-language-th"]
${englishLanguageBtn}  //*[@id="extraction-language-en"]

*** Keywords ***
Select Thai Language
    # Wait Until Element Is Visible    ${changeLanguageBtn} 
    Run Until Keyword Succeed    Click Element    ${changeLanguageBtn}
    Run Until Keyword Succeed    Click Element    ${thaiLnaguageBtn}

Select Eng Language
    # Wait Until Element Is Visible    ${changeLanguageBtn} 
    Run Until Keyword Succeed    Click Element    ${changeLanguageBtn}
    Run Until Keyword Succeed    Click Element    ${englishLanguageBtn}
