*** Settings ***
Resource     ../Resourses/Imports.robot
Resource     ../Keywords/LoginKeyword.robot
Resource    ../Resourses/TestData/sit/UserLogin.robot

*** Test Cases ***
Login
    Open Browser And Sign In With Username And Password
    ...    ${username1}
    ...    documate1234@Appman