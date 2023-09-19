*** Settings ***
Resource    ../Keywords/Utils.robot
Library     SeleniumLibrary

*** Variables ***
${submitButton}   //*[@id="result-panel"]/div[2]/div[2]

*** Keywords ***
Click Submit Button On editor Page 
    Run Until Keyword Succeed    Click Element   ${submitButton}