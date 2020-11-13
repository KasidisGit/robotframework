*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome
${KEYWORD}    USElection2020
${EXPECTED_RESULT}    US Election 2020 - BBC News

*** Keywords ***
พิมพ์ google.com
    Open Browser    ${URL}    ${BROWSER}

พิมพ์คำค้นหา
    Input Text    Xpath:/html/body/div[2]/div[2]/form/div[2]/div[1]/div[1]/div/div[2]/input    ${KEYWORD}

กด Enter
    Press Keys    Xpath:/html/body/div[2]/div[2]/form/div[2]/div[1]/div[1]/div/div[2]/input    RETURN

ตรวจสอบการค้นหา
    Wait Until Page Contains    ${EXPECTED_RESULT}
    Close Browser