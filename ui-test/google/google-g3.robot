*** Settings ***
Library    SeleniumLibrary
Resource    resource-g3.robot

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
