*** Keywords ***
Open Web
    [Arguments]                     ${url}
    Browser.New Browser             chromium        headless=False
    Browser.New Page                ${url}
    Browser.Set Viewport Size       1920        1080

Close Web
    Browser.Close Browser

Wait and Click
    [Arguments]     ${locator}
    Browser.Wait For Elements State     ${locator}        visible       20s
    Browser.Click                       ${locator}