*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Test search keywork and verify search results on Google
    พิมพ์ google.com
    พิมพ์คำค้นหา USElection2020
    กด Enter
    หา US Election 2020 - BBC News

*** Keywords ***
พิมพ์ google.com
    Open Browser    https://www.google.com    chrome

พิมพ์คำค้นหา USElection2020
    Input Text    name:q    USElection2020

กด Enter
    Press Keys    name:q    RETURN

หา US Election 2020 - BBC News
    Wait Until Page Contains    US Election 2020 - BBC News