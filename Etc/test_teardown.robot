*** Settings ***
Library         Browser
Library         SeleniumLibrary
Test Teardown      Capture And Close On Teardown

*** Variables ***
${url}      https://training-platform.doppio-tech.com/

*** Keywords ***
Open Browser
    [Arguments]                     ${url}
    Browser.New Browser             chromium        headless=False
    Browser.New Page                ${url}
    Browser.Set Viewport Size       1920        1080

Close Browser
    Browser.Close Browser

Test Evaluate Pass
    ${result}=    Evaluate    10 < 20
    BuiltIn.Should Be True      ${result}

Test Evaluate Fail
    ${result}=    Evaluate    10 > 20
    BuiltIn.Should Be True      ${result}

Capture And Close On Teardown
    Run Keyword If Test Failed    Take Screenshot    filename=Output/test_fail.png
    Close Browser

*** Test Cases ***
TC_001 - Test Fail
    Open Browser  ${url}
    Test Evaluate Fail

TC_002 - Test Pass
    Open Browser  ${url}
    Test Evaluate Pass