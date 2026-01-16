*** Settings ***
Library         Browser

*** Variables ***
${url}      https://www.google.co.th


*** Keywords ***
Open Web
    [Arguments]     ${url}
    New Browser     chromium        headless=False
    New Page        ${url}

Close Web
    Close Browser

*** Test Cases ***
Open Web
    Open Web        ${url}