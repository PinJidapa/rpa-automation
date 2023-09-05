*** Settings ***
Resource        ../Page/BankBookEditorPage.robot
Resource        ../Resourses/TestData/${env}/config.robot

*** Keywords ***
Verify Element In Book Bank Page
    Verify The Field In Bank Book

Input Book Bank Detail
    Edit Bank Code In Bank Book
    
