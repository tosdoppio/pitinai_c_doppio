*** Variables ***
${url}                          https://bitazza.co.th/home
${lc_market_dropdown}           //button[@id='dropdown-basic' and .//div[normalize-space(.)='ตลาดซื้อขาย']]
${lc_market_selection}          (//div[contains(@class,'HeaderNav_ItemTitle') and normalize-space(.)='ตลาดซื้อขาย'])[1]
${lc_market_header}             //a[@id='header_market']
${lc_market_table}              //tbody
${lc_row_by_coin_name}          //tbody//tr[.//div[contains(@class,'text-product_h6') and normalize-space(.)='{}']]
${lc_price_by_coin_name}        //tbody//tr[.//div[contains(@class,'text-product_h6') and normalize-space(.)='{}']]/td[2]