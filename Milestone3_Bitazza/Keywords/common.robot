*** Keywords ***
Open Browser
    [Arguments]                     ${url}
    Browser.New Browser             chromium        headless=False
    Browser.New Page                ${url}
    Browser.Set Viewport Size       1920        1080

Close Browser
    Browser.Close Browser

Click Element when ready
    [Arguments]     ${locator}
    Browser.Wait For Elements State     ${locator}        visible       20s
    Browser.Click                       ${locator}