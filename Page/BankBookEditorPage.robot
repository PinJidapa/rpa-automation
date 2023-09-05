*** Settings ***
Library           SeleniumLibrary

*** Variables ***
#BankBook Title
${bankBookTitle}    //p[contains(text(),'Bank book')]
${bankSection}    //button[@id='Bank']
${bankBookSection}    //button[@id='Bank Book']
${bankCodeFieldTitle}    //p[contains(text(),'Bank Code')]
${branchFieldTitle}    //p[contains(text(),'Branch')]
${accountNameFieldTitle}    //p[contains(text(),'Account Name')]
${bankNameEnFieldTitle}    //p[contains(text(),'Bank Name (EN)')]
${bankNameThFieldTitle}    //p[contains(text(),'Bank Name (TH)')]
${accountNoFieldTitle}    //p[contains(text(),'Account Number')]
#BankBook Field
${BankCodeField}        //textarea[@data-label="Bank Code"]
*** Keywords ***
Verify The Field In Bank Book
    Wait Until Element Is Visible    ${bankBookTitle}    10s
    Wait Until Element Is Visible    ${bankSection}    10s
    Wait Until Element Is Visible    ${bankBookSection}    10s
    Wait Until Element Is Visible    ${bankCodeFieldTitle}    10s
    Wait Until Element Is Visible    ${branchFieldTitle}    10s
    Wait Until Element Is Visible    ${accountNameFieldTitle}    10s    
    Wait Until Element Is Visible    ${bankNameEnFieldTitle}    10s
    Wait Until Element Is Visible    ${bankNameThFieldTitle}    10s 
    Wait Until Element Is Visible    ${accountNoFieldTitle}    10s  

Edit Bank Code In Bank Book
    Input Text    ${BankCodeField}     xxxx
    Sleep    10s
    
