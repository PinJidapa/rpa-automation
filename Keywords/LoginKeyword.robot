*** Settings ***
Resource        ../Page/LoginPage.robot
Resource        ../Resourses/TestData/${env}/config.robot

*** Keywords ***
Open Browser And Sign In With Username And Password
    [Arguments]    ${username}    ${password}
    Open Browser    ${url}    chrome
    ...    ff_profile_dir=set_preference("browser.download.folderList", 2);set_preference("browser.download.dir", r"/Users/pinpinn/rpa-automation/Resourses");set_preference("browser.helperApps.neverAsk.saveToDisk", "application/zip")
    Set Window Position    0    0
    Maximize Browser Window
    Enter Username    ${username}
    Enter Password    ${password}
    Click Sign In Button