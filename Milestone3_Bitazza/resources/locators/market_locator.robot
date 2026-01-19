*** Variables ***
${btn_home_market_menu}             xpath=//button[@id='dropdown-basic' and .//div[normalize-space(.)='ตลาดซื้อขาย']]
${ddl_home_market}                  xpath=(//div[contains(@class,'HeaderNav_ItemTitle') and normalize-space(.)='ตลาดซื้อขาย'])[1]
${btn_trade_market_menu}            xpath=//a[@id='header_market']
${tbl_trade_market}                 xpath=//tbody
${tbl_trade_market_coin_name}       xpath=//tbody//tr[.//div[contains(@class,'text-product_h6') and normalize-space(.)='{}']]
${tbl_trade_market_coin_price}      xpath=//tbody//tr[.//div[contains(@class,'text-product_h6') and normalize-space(.)='{}']]/td[2]