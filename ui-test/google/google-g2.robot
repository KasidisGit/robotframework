*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome
${KEYWORD}    USElection2020
${EXPECTED_RESULT}    US Election 2020 - BBC News

*** Test Cases ***
Test search keywork and verify search results on Google
    พิมพ์ google.com
    พิมพ์คำค้นหา 
    กด Enter
    ตรวจสอบการค้นหา

*** Keywords ***
พิมพ์ google.com
    Open Browser    ${URL}    ${BROWSER}

พิมพ์คำค้นหา
    Input Text    name:q    ${KEYWORD}

กด Enter
    Press Keys    name:q    RETURN

ตรวจสอบการค้นหา
    Wait Until Page Contains    ${EXPECTED_RESULT}
    Close Browser