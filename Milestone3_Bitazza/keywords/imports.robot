*** Settings ***
Library         Browser
Library         String
Resource        ${CURDIR}/common.robot

# Locators
Resource        ${CURDIR}/../resources/locators/market_locator.robot

# Pages
Resource        ${CURDIR}/pages/market_page.robot

# Features
Resource        ${CURDIR}/features/market_feature.robot

# Settings
Resource        ${CURDIR}/../resources/settings/env.robot