*** Settings ***
Resource    ../Page/LanguagePage.robot
Library           SeleniumLibrary
Library     ../Scripts/functions.py

*** Variables ***
#BankBook Title
${bankBookTitle}    //p[contains(text(),'Bank book')]
#Thai

${branchCodeTH}    //p[contains(text(),'รหัสสาขา')]
${bankNameEnFieldTitleTH}    //p[contains(text(),'ชื่อธนาคาร (ภาษาอังกฤษ)')]
${bankNameThFieldTitleTH}    //p[contains(text(),'ชื่อธนาคาร (ภาษาไทย)')]
${branchFieldEnTitleTH}    //p[contains(text(),'ชื่อสาขา (ภาษาอังกฤษ)')]
${branchFieldThTitleTH}    //p[contains(text(),'ชื่อสาขา (ภาษาไทย)')]
${accountNameEnFieldTitleTH}    //p[contains(text(),'ชื่อบัญชี (ภาษาอังกฤษ)')]
${accountNameThFieldTitleTH}    //p[contains(text(),'ชื่อบัญชี (ภาษาไทย)')]
${accountNoFieldTitleTH}    //p[contains(text(),'เลขที่บัญชี')]
${accountTypeThTitleTH}    //p[contains(text(),'ประเภทบัญชี (ภาษาไทย)')]
${accountTypeEnTitleTH}    //p[contains(text(),'ประเภทบัญชี (ภาษาอังกฤษ)')]
${bankCodeTH}    //p[contains(text(),'รหัสธนาคาร')]

#Eng
${branchCodeEN}   //p[contains(text(),'Branch code')]
${bankNameEnFieldTitleEN}   //p[contains(text(),'Bank name (EN)')]
${bankNameThFieldTitleEN}   //p[contains(text(),'Bank name (TH)')]
${branchFieldEnTitleEN}  //p[contains(text(),'Branch name (EN)')]
${branchFieldThTitleEN}    //p[contains(text(),'Branch name (TH)')]
${accountNameEnFieldTitleEN}    //p[contains(text(),'Account name (EN)')]
${accountNameThFieldTitleEN}    //p[contains(text(),'Account name (TH)')]
${accountNoFieldTitleEN}  //p[contains(text(),'Account number')]
${accountTypeThTitleEN}   //p[contains(text(),'Account type (TH)')]
${accountTypeEnTitleEn}    //p[contains(text(),'Account type (EN)')]
${bankCodeEN}   //p[contains(text(),'Bank code')]

#Thai Field 
${branchCodeFieldTH}        //textarea[@data-label="รหัสสาขา"]
${accuntNameEnFieldTH}      //textarea[@data-label="ชื่อธนาคาร (ภาษาอังกฤษ)"]
#Eng Field
${branchCodeFieldEn}    //textarea[@data-label="Branch code"]
${accuntNameEnFieldEn}    //textarea[@data-label="Account name (EN)"]

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
    Wait Until Element Is Visible    ${bankBookTitle}
    Wait Until Element Is Visible    ${branchCodeTH}
    Wait Until Element Is Visible    ${bankNameEnFieldTitleTH}    
    Wait Until Element Is Visible    ${bankNameThFieldTitleTH}   
    Wait Until Element Is Visible    ${branchFieldEnTitleTH}   
    Wait Until Element Is Visible    ${branchFieldThTitleTH}     
    Wait Until Element Is Visible    ${accountNameEnFieldTitleTH}  
    Wait Until Element Is Visible    ${accountNameThFieldTitleTH}  
    Wait Until Element Is Visible    ${accountNoFieldTitleTH}  
    Wait Until Element Is Visible    ${accountTypeThTitleTH}
    Wait Until Element Is Visible    ${accountTypeEnTitleTH} 
    Wait Until Element Is Visible    ${bankCodeTH}

Verify The Field In Bank Book EN
    Select Eng Language
    Wait Until Element Is Visible    ${bankBookTitle}  
    Wait Until Element Is Visible    ${branchCodeEN} 
    Wait Until Element Is Visible    ${bankNameEnFieldTitleEN}  
    Wait Until Element Is Visible    ${bankNameThFieldTitleEN}
    Wait Until Element Is Visible    ${branchFieldEnTitleEN}  
    Wait Until Element Is Visible    ${branchFieldThTitleEN} 
    Wait Until Element Is Visible    ${accountNameEnFieldTitleEN} 
    Wait Until Element Is Visible    ${accountNameThFieldTitleEN}
    Wait Until Element Is Visible    ${accountNoFieldTitleEN}
    Wait Until Element Is Visible    ${accountTypeThTitleEN} 
    Wait Until Element Is Visible    ${accountTypeEnTitleEn}
    Wait Until Element Is Visible    ${bankCodeEN} 

Edit Bank Book EN
    Input Text    ${branchCodeFieldEn}      ;>?Enปิ่น-_-1234$#
    Input Text    ${accuntNameEnFieldEn}    ;>?Enนภ-_-1234$#

Edit Bank Book TH
    Input Text    ${branchCodeFieldTH}      Thปิ่น-_-1234$#;>?
    Input Text    ${accuntNameEnFieldTH}     ;>?Thนภ-_-1234$#

Check The Book Bank Excel File
    ${correctDataList}=     Create List
    ...    {"sheet": "1 - Bank book","data":{"รหัสสาขา": "Thปิ่น-_-1234$#;>?", "ชื่อธนาคาร (ภาษาอังกฤษ)": ";>?Thนภ-_-1234$#", "ชื่อธนาคาร (ภาษาไทย)": "ธนาคารไทยพาณิชย์", "ชื่อสาขา (ภาษาอังกฤษ)": None, "ชื่อสาขา (ภาษาไทย)": None, "ชื่อบัญชี (ภาษาอังกฤษ)": ";>?Enนภ-_-1234$#", "ชื่อบัญชี (ภาษาไทย)": None, "เลขที่บัญชี": "962-240326-4", "ประเภทบัญชี (ภาษาอังกฤษ)": None, "ประเภทบัญชี (ภาษาไทย)": None, "รหัสธนาคาร": "SCB"}}
    ${compare}    functions.compare     ${correctDataList}    ${EXECDIR}/assets/bookbank1.xlsx
    Should Be True    ${compare}