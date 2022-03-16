*** Settings ***
Library         SeleniumLibrary
Library         String
Library         function.py

*** Keywords ***
Open chrome browser ${URL}
    [Documentation]     Open chrome browser
    Open Browser          ${URL}      chrome
    Maximize Browser Window
    Set Selenium Speed    0.1s

Open chrome browser with headless mode ${URL}
    [Documentation]     Open chrome browser with headless mode
    Open Browser          ${URL}      headlesschrome
    Set Window Size       1440        768
    Set Selenium Speed    0.1s