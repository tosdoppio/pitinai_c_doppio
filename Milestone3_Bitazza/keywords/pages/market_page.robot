*** Keywords ***
Go To Trade Market Page
    common.Click Element when ready          ${btn_home_market_menu}
    common.Click Element when ready          ${ddl_home_market}
    common.Click Element when ready          ${btn_trade_market_menu}

# Get ราคาของ coin
Get Coin Price
    [Arguments]     ${coin_name} 
    ${price_locator}=    String.Format String    ${tbl_trade_market_coin_price}    ${coin_name}
    Browser.Wait For Elements State          ${price_locator}
    ${price}=    Browser.Get Text    ${price_locator}
    # BuiltIn.Log To Console      Coin name = ${coin_name} and Price = ${price}
    RETURN    ${price}