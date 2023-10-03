*** Settings ***
Resource    ../Page/LanguagePage.robot
Library           SeleniumLibrary
Library     ../Scripts/functions.py

*** Variables ***
#BankBook Title
${truckRegisTitle}    //p[contains(text(),'Truck Registration Document OCR - Registration Pag')]

#Thai
${registerDateTH}   //p[contains(text(),'วันจดทะเบียน')]
${licenseNumberTH}   //p[contains(text(),'เลขทะเบียน')]
${licenseProvinceTH}   //p[contains(text(),'จังหวัด')]
${fuelTypeTH}  //p[contains(text(),'ชนิดเชื้อเพลิง')]
${TypeTH}    //p[contains(text(),'ประเภท')]
${bodyTypeTH}    //p[contains(text(),'ลักษณะ/มาตราฐาน')]
${brandTH}    //p[contains(text(),'ยี่ห้อรถ')]
${modelTH}  //p[contains(text(),'แบบ/รุ่น')]
${colorTH}   //p[contains(text(),'สี')]
${chassisNumberTH}    //p[contains(text(),'เลขตัวรถ')]
${cassisLocationTH}   //p[contains(text(),'ตำแหน่งเลขตัวรถ')]
${engineBrandTH}    //p[contains(text(),'ยี่ห้อเครื่องยนต์')]
${engineNumberTH}    //p[contains(text(),'เลขเครื่องยนต์')]
${engineLocationTH}    //p[contains(text(),'ตำแหน่งเลขเครื่องยนต์')]
${pistonTH}    //p[contains(text(),'จำนวนเลขเครื่องยนต์')]
${HPTH}    //p[contains(text(),'สูบ')]
${shaftTH}    //p[contains(text(),'แรงม้า')]
${carWeightTH}    //p[contains(text(),'น้ำหนักรถ')]
${seatNumberTH}    //p[contains(text(),'จำนวนผู้ที่นั่งโดยสาร')]
${standNumberTH}    //p[contains(text(),'จำนวนที่ยืนผู้โดยสาร')]
${shaftWeightTH}    //p[contains(text(),'น้ำหนักบรรทุกหรือน้ำหนักลงเพลา')]
${grossWeightTH}    //p[contains(text(),'น้ำหนักรวม (กก.)')]

#Eng
${registerDateEN}   //p[contains(text(),'Register Date')]
${licenseNumberEN}   //p[contains(text(),'License Number')]
${licenseProvinceEN}   //p[contains(text(),'License Province')]
${fuelTypeEN}  //p[contains(text(),'Fuel Type')]
${TypeEN}    //p[contains(text(),'Type')]
${bodyTypeEN}    //p[contains(text(),'Body Type')]
${brandEN}    //p[contains(text(),'Brand')]
${modelEN}  //p[contains(text(),'Model')]
${colorEN}   //p[contains(text(),'Color')]
${chassisNumberEN}    //p[contains(text(),'Chassis Number')]
${cassisLocationEN}   //p[contains(text(),'Cassis Location')]
${engineBrandEN}    //p[contains(text(),'Engine Brand')]
${engineNumberEN}    //p[contains(text(),'Engine Number')]
${engineLocationEN}    //p[contains(text(),'Engine Location')]
${pistonEN}    //p[contains(text(),'Piston')]
${HPEN}    //p[contains(text(),'HP')]
${shaftEN}    //p[contains(text(),'Shaft')]
${carWeightEN}    //p[contains(text(),'Car Weight')]
${seatNumberEN}    //p[contains(text(),'Seat Number')]
${standNumberEN}    //p[contains(text(),'Stand Number')]
${shaftWeightEN}    //p[contains(text(),'Shaft Weight')]
${grossWeightEN}    //p[contains(text(),'Gross Weight (KG.)')]

#Thai Field 
${colorFieldTH}        //textarea[@data-label="สี"]
${pistonFieldTH}      //textarea[@data-label="จำนวนเลขเครื่องยนต์"]
#Eng Field
${shaftWeightFieldEn}    //textarea[@data-label="Shaft Weight"]
${grossWeightFieldEn}    //textarea[@data-label="Gross Weight (KG.)"]

*** Keywords ***

Select Language For Truck Registration And Verify The Field
    [Arguments]    ${lang}
    IF    ${lang} == "TH"
        Verify The Field In Truck Registration TH
        Edit Truck Registration TH
    ELSE 
        Verify The Field In Truck Registration EN
        Edit Truck Registration EN
    END

Verify The Field In Truck Registration TH
    Select Thai Language
    Wait Until Element Is Visible    ${registerDateTH} 
    Wait Until Element Is Visible    ${registerDateTH}  
    Wait Until Element Is Visible    ${licenseNumberTH}  
    Wait Until Element Is Visible    ${licenseProvinceTH}   
    Wait Until Element Is Visible    ${fuelTypeTH} 
    Wait Until Element Is Visible    ${TypeTH}   
    Wait Until Element Is Visible    ${bodyTypeTH}   
    Wait Until Element Is Visible    ${brandTH}  
    Wait Until Element Is Visible    ${modelTH} 
    Wait Until Element Is Visible    ${colorTH}  
    Wait Until Element Is Visible    ${chassisNumberTH}   
    Wait Until Element Is Visible    ${cassisLocationTH}  
    Wait Until Element Is Visible    ${engineBrandTH}   
    Wait Until Element Is Visible    ${engineNumberTH}  
    Wait Until Element Is Visible    ${engineLocationTH}  
    Scroll Element Into View    ${pistonTH} 
    Wait Until Element Is Visible    ${pistonTH}   
    Wait Until Element Is Visible    ${HPTH}  
    Wait Until Element Is Visible    ${shaftTH}  
    Wait Until Element Is Visible    ${carWeightTH}  
    Wait Until Element Is Visible    ${seatNumberTH}  
    Wait Until Element Is Visible    ${standNumberTH}   
    Wait Until Element Is Visible    ${shaftWeightTH}  
    Wait Until Element Is Visible    ${grossWeightTH}  

Verify The Field In Truck Registration EN
    Select Eng Language
    Wait Until Element Is Visible    ${registerDateEN}  
    Wait Until Element Is Visible    ${licenseNumberEN}  
    Wait Until Element Is Visible    ${licenseProvinceEN}   
    Wait Until Element Is Visible    ${fuelTypeEN} 
    Wait Until Element Is Visible    ${TypeEN}   
    Wait Until Element Is Visible    ${bodyTypeEN}   
    Wait Until Element Is Visible    ${brandEN}  
    Wait Until Element Is Visible    ${modelEN} 
    Wait Until Element Is Visible    ${colorEN}  
    Wait Until Element Is Visible    ${chassisNumberEN}   
    Wait Until Element Is Visible    ${cassisLocationEN}  
    Wait Until Element Is Visible    ${engineBrandEN}   
    Wait Until Element Is Visible    ${engineNumberEN}  
    Wait Until Element Is Visible    ${engineLocationEN}  
    Scroll Element Into View    ${pistonEN}
    Wait Until Element Is Visible    ${pistonEN}   
    Wait Until Element Is Visible    ${HPEN}  
    Wait Until Element Is Visible    ${shaftEN}  
    Wait Until Element Is Visible    ${carWeightEN}  
    Wait Until Element Is Visible    ${seatNumberEN}  
    Wait Until Element Is Visible    ${standNumberEN}  
    Scroll Element Into View    ${grossWeightEN}  
    Wait Until Element Is Visible    ${shaftWeightEN}  
    Wait Until Element Is Visible    ${grossWeightEN}  

Edit Truck Registration EN
    Scroll Element Into View    ${shaftWeightFieldEn}
    Input Text    ${shaftWeightFieldEn}    ;>?Enปิ่น-_-1234$#
    Scroll Element Into View    ${grossWeightFieldEn}
    Input Text    ${grossWeightFieldEn}    ;>?Enนภ-_-1234$#

Edit Truck Registration TH
    Scroll Element Into View    ${colorFieldTH}
    Input Text    ${colorFieldTH}    Thปิ่น-_-1234$#;>?
    Scroll Element Into View    ${pistonFieldTH}
    Input Text    ${pistonFieldTH}   ;>?Thนภ-_-1234$#

Check The Truck Registration Excel File
    ${correctDataList}=     Create List
    ...    {'วันจดทะเบียน': '31 ธันวาคม 2558', 'เลขทะเบียน': '15-9554', 'จังหวัด': 'กรุงเทพมหานคร', 'ชนิดเชื้อเพลิง': 'ชนิดเชื้อเพลิง แก๊สNGV', 'ประเภท': 'รถโดยสาร ประจำทาง', 'ลักษณะ/มาตราฐาน': 'ม.2 (ข)', 'ยี่ห้อรถ': 'HIGER', 'แบบ/รุ่น': 'UDB4RDRE2GEWDDER-C', 'สี': 'Thปิ่น-_-1234$#;>?', 'เลขตัวรถ': 'JN1UB4E26Z0000000', 'ตำแหน่งเลขตัวรถ': 'หน้าขวา', 'ยี่ห้อเครื่องยนต์': 'HIGER', 'เลขเครื่องยนต์': 'QR25-518994Q', 'ตำแหน่งเลขเครื่องยนต์': 'ท้ายเครื่อง', 'จำนวนเลขเครื่องยนต์': ';>?Thนภ-_-1234$#', 'แรงม้า': '2 เพลา 4 ล้อ ยาง 6 เส้น', 'น้ำหนักรถ': 12400, 'จำนวนผู้ที่นั่งโดยสาร': 31, 'จำนวนที่ยืนผู้โดยสาร': 33, 'น้ำหนักบรรทุกหรือน้ำหนักลงเพลา': ';>?Enปิ่น-_-1234$#', 'น้ำหนักรวม (กก.)': ';>?Enนภ-_-1234$#'}
    ${compare}    functions.compare     ${correctDataList}    ${EXECDIR}/assets/truckRegist1.xlsx 
    Should Be True    ${compare}