*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.facebook.com
${EMAIL}    email
${PASS}    password
${TEXT}    สวัสดี Robotframework

*** Test Cases ***
user sign in to facebook and create a post
    Search facebook.com
    Fill email and password to login facebook
    Hit Enter
    Wait For Facebook Page
    Click Post Box
    Wait For Post Form
    Create Post and Submit

*** Keywords ***
Search facebook.com
    Open Browser    ${URL}    chrome

Fill email and password to login facebook
    Input Text    name:email    ${EMAIL}
    Input Text    name:pass     ${PASS}

Hit Enter
    Press Keys    name:pass    RETURN

Wait For Facebook Page
    Wait Until Page Contains Element    Xpath://*[@id="mount_0_0"]/div/div[1]/div[1]/div[3]/div/div/div[1]/div[1]/div/div[2]/div/div/div[3]/div/div[2]/div/div/div/div[1]/div    timeout=10000
    
Click Post Box
    Click Element    Xpath://*[@id="mount_0_0"]/div/div[1]/div[1]/div[3]/div/div/div[1]/div[1]/div/div[2]/div/div/div[3]/div/div[2]/div/div/div/div[1]/div    action_chain=True

Wait For Post Form
    Wait Until Element Is Enabled    Xpath://*[@id="mount_0_0"]/div/div[1]/div[1]/div[4]/div/div/div[1]/div/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[2]/div

Create Post and Submit
    Press Keys    None    ${TEXT}
    Click Element     Xpath://*[@id="mount_0_0"]/div/div[1]/div[1]/div[4]/div/div/div[1]/div/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[2]/div