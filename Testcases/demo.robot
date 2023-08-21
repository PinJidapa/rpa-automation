*** Settings ***
Resource     ../Keywords/LoginKeyword.robot
Variables    ../Resourses/TestData/${env}/UserLogin.yaml

*** Test Cases ***
Login
    Open Browser And Sign In With Username And Password    ${username1}    ${password1}