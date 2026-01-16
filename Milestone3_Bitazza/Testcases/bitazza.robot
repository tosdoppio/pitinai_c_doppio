*** Settings ***
Library         Browser
Library         String

*** Variables ***
${url}                          https://bitazza.co.th/home
${lc_market_dropdown}           //button[@id='dropdown-basic' and .//div[normalize-space(.)='ตลาดซื้อขาย']]
${lc_market_selection}          (//div[contains(@class,'HeaderNav_ItemTitle') and normalize-space(.)='ตลาดซื้อขาย'])[1]
${lc_market_header}             //a[@id='header_market']
${lc_market_table}              //tbody
${lc_row_by_coin_name}          //tbody//tr[.//div[contains(@class,'text-product_h6') and normalize-space(.)='{}']]
${lc_price_by_coin_name}        //tbody//tr[.//div[contains(@class,'text-product_h6') and normalize-space(.)='{}']]/td[2]

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

Go to Trading Market Page
    Wait and Click          ${lc_market_dropdown}
    Wait and Click          ${lc_market_selection}
    Wait and Click          ${lc_market_header}

# Verify coint
Verify coins name in table
    [Arguments]    @{coin_names}       
    Browser.Wait For Elements State        ${lc_market_table}        visible    20s   
    FOR    ${coin}    IN    @{coin_names}
        ${row_locator}=    String.Format String    ${lc_row_by_coin_name}    ${coin}
        Browser.Wait For Elements State    ${row_locator}    visible    20s
    END

# Get ราคาของ coin
Get Coin Price
    [Arguments]     ${coin_name} 
    ${price_locator}=    String.Format String    ${lc_price_by_coin_name}    ${coin_name}
    Browser.Wait For Elements State             ${price_locator}    visible    20s
    ${price}=    Browser.Get Text    ${price_locator}
    # BuiltIn.Log To Console      Coin name = ${coin_name} and Price = ${price}
    [Return]    ${price}

# Verify ราคาของ coin
Verify coins price by name
    [Arguments]     ${coin_name}    ${min_price}
    ${raw_price}=               Get Coin Price    ${coin_name}
    BuiltIn.Log To Console      Coin Name = ${coin_name}
    BuiltIn.Log To Console      Raw Price = '${raw_price}'

    # ลบ THB, ช่องว่าง, comma ออก
    ${clean_price}=             String.Remove String   ${raw_price}    THB     ,
    BuiltIn.Log To Console      No THB = ${clean_price}

    # แปลง string เป็น float
    ${clean_price}=             BuiltIn.Convert To Number    ${clean_price}
    BuiltIn.Log To Console      Price = ${clean_price}
    ${type}=    BuiltIn.Evaluate    type(${clean_price}).__name__
    BuiltIn.Log To Console      Price Type = ${type}

    # เช็คราคามากกว่า min price
    BuiltIn.Should Be True          ${clean_price} > ${min_price}
    BuiltIn.Log To Console          Total price = ${clean_price} > ${min_price}

*** Test Cases ***
Open Web and verify coin 
    Open Web        ${url}
    Go to Trading Market Page
    Verify coins name in table    Bitcoin   Ethereum    Moo Deng    USD Tether
    Verify coins price by name     Ethereum     30000
    Close Web