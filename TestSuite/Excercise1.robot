*** Settings ***
Resource            ../Resources.robot
Resource            ../PageObject/ebayHomePage.robot
Test Setup          Open chrome browser ${URL}
Test Teardown       Close Browser

*** Variables ***
${URL}              https://www.ebay.com/
${Keywords}         iPhone
${count_item}       3

*** Test Cases ***
Access a Product via category after applying multiple filters
    GIVEN 3 filters - screen size, Price and Item location
    WHEN Request filters
    THEN Verify the filter and counting tags result shound be ${count_item}

Access a Product via Search
    GIVEN Input string and to search field and set the category using keywords ${Keywords}
    WHEN Hit button Search
    THEN Verify that the first result name matches with the search string ${Keywords}
