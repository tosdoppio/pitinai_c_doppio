*** Settings ***
Resource        ${CURDIR}/../keywords/imports.robot

*** Test Cases ***
TC_001 - Verify Coin Name And Price
    common.Open Browser                            ${bitazza.url}
    market_page.Go To Trade Market Page
    market_feature.Check Coin Name In Table        Bitcoin   Ethereum    Moo Deng    USD Tether
    market_feature.Check Coin Price By Name        Ethereum    30000
    common.Close Browser