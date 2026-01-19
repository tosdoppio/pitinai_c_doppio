*** Keywords ***
# Check coin name
Check Coin Name In Table
    [Arguments]    @{coin_names}       
    Browser.Wait For Elements State        ${tbl_trade_market} 
    FOR    ${coin}    IN    @{coin_names}
        ${row_locator}=    String.Format String    ${tbl_trade_market_coin_name}    ${coin}
        Browser.Wait For Elements State    ${row_locator}
    END
    BuiltIn.Log To Console      Selected Coin = ${coin_names}
    

# Check coin price
Check Coin Price By Name
    [Arguments]     ${coin_name}    ${min_price}
    ${raw_price}=               market_page.Get Coin Price    ${coin_name}

    # ลบ THB, ช่องว่าง, comma ออก
    ${clean_price}=             String.Remove String   ${raw_price}    THB     ,

    # แปลง string เป็น float
    ${clean_price}=             BuiltIn.Convert To Number    ${clean_price}

    # เช็คราคามากกว่า min price
    BuiltIn.Should Be True          ${clean_price} > ${min_price}
    BuiltIn.Log To Console          Total price of ${coin_name} = ${clean_price} (> ${min_price})