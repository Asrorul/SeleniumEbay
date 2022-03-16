***Variables***
${Menu_Electronics}                     //body/div[@id='mainContent']/div[@class='hl-cat-nav']/ul[@class='hl-cat-nav__container']/li[3]
${Menu_cellphoneAndaccesories}          //div[normalize-space()='Cell Phones, Smart Watches & Accessories']
${Menu_cellphoneAndSmartPhone}          //div[normalize-space()='Cell Phones & Smartphones']
${Element_AllFilter}                    //button[@aria-label='All Filters']
${Tray_AllFilter}                       //div[@class='x-overlay__wrapper--right']
${filter_screensize}                    //span[normalize-space()='Screen Size']
${checkBox_screensize_6inOrMore}        //input[@id='c3-subPanel-Screen%20Size_6%20in%20or%20More_cbx']
${filter_prize}                         //div[@id='c3-mainPanel-price']
${field_start_price_filter}             //input[@aria-label='Minimum Value, US Dollar']
${field_end_price_filter}               //input[@aria-label='Maximum Value, US Dollar']
${filter_item_location}                 //span[normalize-space()='Item Location']
${radioButton_filterLocation}           //input[@aria-label='Asia']
${button_apply_filter}                  //button[@aria-label='Apply']
${VALUE_START_PRICE}                    2000000
${VALUE_END_PRICE}                      6000000
${counter_filterApplied}                //div[@id='s0-27_1-9-0-1[0]-0-0-6-5-4[0]-flyout']//button[@type='button']
${TrayFilterApplied}                    //div[@id="s0-27_1-9-0-1[0]-0-0-6-5-4[0]-flyout"]/div/ul
${item_filter_applied}                  //*[@id="s0-27_1-9-0-1[0]-0-0-6-5-4[0]-flyout"]/div/ul/li
${search_field}                         //input[@id='gh-ac']
${dropdown_category_besideSearchField}  //select[@name="_sacat"]
${category_option_to_select}            //option[contains(text(),'Computers/Tablets & Networking')]
${search_button}                        //input[@id='gh-btn']
${first_result_title}                   //div[@id='srp-river-results']//li[1]//div[1]//div[2]//a[1]//h3[1]


*** Keywords ***
3 filters - screen size, Price and Item location
    Wait Until Element Is Visible         ${Menu_Electronics}                        1m
    Click Element                         ${Menu_Electronics}
    Wait Until Element Is Visible         ${Menu_cellphoneAndaccesories}             1m
    Click Element                         ${Menu_cellphoneAndaccesories}
    Wait Until Element Is Visible         ${Menu_cellphoneAndSmartPhone}             1m
    Click Element                         ${Menu_cellphoneAndSmartPhone}
    Wait Until Element Is Visible         ${Element_AllFilter}                       1m
    Click Element                         ${Element_AllFilter}
    Wait Until Element Is Visible         ${Tray_AllFilter}
    Wait Until Element Is Visible         ${filter_screensize}                       1m
    Click Element                         ${filter_screensize}
    Wait Until Element Is Visible         ${checkBox_screensize_6inOrMore}           1m
    Click Element                         ${checkBox_screensize_6inOrMore}
    Wait Until Element Is Visible         ${filter_prize}                            1m
    Click Element                         ${filter_prize}
    Wait Until Element Is Visible         ${field_start_price_filter}                1m
    Input Text                            ${field_start_price_filter}                ${VALUE_START_PRICE}
    Wait Until Element Is Visible         ${field_end_price_filter}                  1m
    Input Text                            ${field_end_price_filter}                  ${VALUE_END_PRICE}
    Wait Until Element Is Visible         ${filter_item_location}                    1m
    Click Element                         ${filter_item_location}
    Wait Until Element Is Visible         ${radioButton_filterLocation}              1m
    Click Element                         ${radioButton_filterLocation}
    
Request filters
    Wait Until Element Is Visible         ${button_apply_filter}              1m
    Click Element                         ${button_apply_filter}

Verify the filter and counting tags result shound be ${count_item}
    Wait Until Element Is Visible         ${counter_filterApplied}              1m
    Click Element                         ${counter_filterApplied}
    Wait Until Element Is Visible         ${TrayFilterApplied}                  1m
    ${Count}=                             Get Element Count                     ${item_filter_applied}
    Should Be True                        ${Count}                              ${count_item}

Input string and to search field and set the category using keywords ${Keywords}
    Wait Until Element Is Visible         ${search_field}                               1m
    Input Text                            ${search_field}                               ${Keywords}
    Click Element                         ${dropdown_category_besideSearchField}
    wait until element is visible         ${category_option_to_select}
    click element                         ${category_option_to_select}
    
Hit button Search
    Click Element                         ${search_button}
    
Verify that the first result name matches with the search string ${keywords}
    ${text_result}=           Get Text                  ${first_result_title}
    ${str1} =	              Convert To Uppercase  	${text_result}
    ${str2} =	              Convert To Uppercase  	${Keywords}
    Should Contain          '${str1}'                  ${str2}
