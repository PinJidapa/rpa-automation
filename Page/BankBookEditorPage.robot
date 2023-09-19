*** Settings ***
Resource    ../Page/languagePage.robot
Library           SeleniumLibrary

*** Variables ***
#BankBook Title
${bankBookTitle}    //p[contains(text(),'Bank book')]
#Thai
${bankSectionTH}    //button[@id='ธนาคาร']
${bankBookSectionTH}    //button[@id='สมุดบัญชีธนาคาร']
${bankCodeFieldTitleTH}    //p[contains(text(),'เลขที่บัญชี')]
${branchFieldTitleTH}    //p[contains(text(),'สาขา')]
${accountNameFieldTitleTH}    //p[contains(text(),'ชื่อบัญชี')]
${bankNameEnFieldTitleTH}    //p[contains(text(),'ชื่อธนาคาร (อังกฤษ)')]
${bankNameThFieldTitleTH}    //p[contains(text(),'ชื่อธนาคาร (ไทย)')]
${accountNoFieldTitleTH}    //p[contains(text(),'เลขที่บัญชี')]

#Eng
${bankSectionEN}    //button[@id='Bank']
${bankBookSectionEN}    //button[@id='Bank Book']
${bankCodeFieldTitleEN}    //p[contains(text(),'Bank Code')]
${branchFieldTitleEN}    //p[contains(text(),'Branch')]
${accountNameFieldTitleEN}    //p[contains(text(),'Account Name')]
${bankNameEnFieldTitleEN}    //p[contains(text(),'Bank Name (EN)')]
${bankNameThFieldTitleEN}    //p[contains(text(),'Bank Name (TH)')]
${accountNoFieldTitleEN}    //p[contains(text(),'Account Number')]

#Field Thai
${bankCodeFieldEN}        //textarea[@data-label="Bank Code"]
${accuntNameFieldEN}        //textarea[@data-label="Account Name"]

#Field Eng
${bankCodeFieldTH}        //textarea[@data-label="ชื่อธนาคาร"]
${accuntNameFieldTH}        //textarea[@data-label="ชื่อบัญชี"]

${submitBtn}    //*[@id="extracttion-submit"]

*** Keywords ***

Select Language For BookBank And Verify The Field
    [Arguments]    ${lang}
    IF    ${lang} == "TH"
        Verify The Field In Bank Book TH
        Edit Bank Book TH
    ELSE 
        Verify The Field In Bank Book EN
        Edit Bank Book EN
    END

Verify The Field In Bank Book TH
    Select Thai Language
    Wait Until Element Is Visible    ${bankBookTitle}    20s
    Wait Until Element Is Visible    ${bankSectionTH}    20s
    Wait Until Element Is Visible    ${bankBookSectionTH}    20s
    Wait Until Element Is Visible    ${bankCodeFieldTitleTH}    10s
    Wait Until Element Is Visible    ${branchFieldTitleTH}    10s
    Wait Until Element Is Visible    ${accountNameFieldTitleTH}    10s    
    Wait Until Element Is Visible    ${bankNameEnFieldTitleTH}    10s
    Wait Until Element Is Visible    ${bankNameThFieldTitleTH}    10s 
    Wait Until Element Is Visible    ${accountNoFieldTitleTH}    10s  

Verify The Field In Bank Book EN
    Select Eng Language
    Wait Until Element Is Visible    ${bankBookTitle}    20s
    Wait Until Element Is Visible    ${bankSectionEN}    20s
    Wait Until Element Is Visible    ${bankBookSectionEN}    20s
    Wait Until Element Is Visible    ${bankCodeFieldTitleEN}    10s
    Wait Until Element Is Visible    ${branchFieldTitleEN}    10s
    Wait Until Element Is Visible    ${accountNameFieldTitleEN}    10s    
    Wait Until Element Is Visible    ${bankNameEnFieldTitleEN}    10s
    Wait Until Element Is Visible    ${bankNameThFieldTitleEN}    10s 
    Wait Until Element Is Visible    ${accountNoFieldTitleEN}    10s  

Edit Bank Book EN
    Input Text    ${bankCodeFieldEN}     ;>?Enปิ่น-_-1234$#
    Input Text    ${accuntNameFieldEN}    ;>?Enนภ-_-1234$#

Edit Bank Book TH
    Input Text    ${bankCodeFieldTH}     Thปิ่น-_-1234$#;>?
    Input Text    ${accuntNameFieldTH}    ;>?Thนภ-_-1234$#