*** Settings ***
Resource    ../Resource.robot

*** Keywords ***
Get On Session Of Penup Image
    Log To Console    Get On Session Of Penup Image
    Sleep    2s
    ${image_loc}    Get WebElement    ${Web_Penup_Image}
    ${image_value}    Get Element Attribute    ${image_loc}    ${Attribute_Style}
    ${image_value}    Fetch From Right    ${image_value}    url("
    ${image_value}    Fetch From Left    ${image_value}    ");
    Log To Console    ${image_value}
    Create Session    user    ${image_value}    verify=${True}
    ${response}    GET On Session    user    ${image_value}
    
    Should Be Equal As Strings    ${response}    <Response [200]>
    
Open Penup Browser
    Log To Console    Open Penup Browser
    Open Browser    ${PENUP_URL}    ${BROWSER_CHROME}    options=${CHROME_OPTIONS1}
    Maximize Browser Window
    Verify Penup MainPage Display
    
Verify Penup MainPage Display
    Log To Console    Verify Penup MainPage Display
    Wait Until Element Is Visible    ${Web_Penup_MainPage_Icon}

Verify Penup Artwork Image Display
    Log To Console    Verify Penup Artwork Image Display
    Wait Until Element Is Visible    ${Web_Penup_Image}
    
Click Artwork Image
    Log To Console    Click Artwork Image
    Click Element    ${Web_Penup_Image}
    
Verify Artwork Image Detail Page Display
    Log To Console    Verify Artwork Image Detail Page Display
    Wait Until Element Is Visible    ${Web_Penup_Detail_Image}
    
Get Category Name
    Log To Console    Get Category Name
    ${category}    Create List
    ${length}    Get Length    ${PENUP_CATEGORY}
    FOR    ${num}    IN RANGE    ${length}
        ${num}    Evaluate    ${num}+1    
        ${num}    Convert To String    ${num}
        ${Web_Penup_Penup_Category}    Replace String    ${Web_Penup_Penup_Category_loc}    ****    ${num}
        ${category_name}    SeleniumLibrary.Get Text    ${Web_Penup_Penup_Category}
        Append To List    ${category}    ${category_name}
        
    END
    Log To Console    ${category}
    ${category}    Set Suite Variable    ${category}

Verify Compare Category Name Display
    Log To Console    Verify Compare Category Name Display
    Get Category Name
    Should Be Equal    ${category}    ${PENUP_CATEGORY}
    
Click Search Icon
    Log To Console    Click Search Icon
    Click Element    ${Web_Penup_Search_Icon}
    Wait Until Element Is Visible    ${Web_Penup_Search_Input}
    
Input Search Data
    [Arguments]    ${data}
    Log To Console    Input Search Data : [${data}]
    SeleniumLibrary.Input Text    ${Web_Penup_Search_Input}    ${data}
    Press Keys    NONE    ENTER
    
Verify Search Data Result Display
    Log To Console    Verify Search Data Result Display
    ${fail_status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${Web_Penup_Search_No_Rusult}    timeout=3
    Run Keyword If    ${fail_status}    Fail    There is no Search Result.
    Wait Until Element Is Visible    ${Web_Penup_Image}
    Wait Until Element Is Visible    ${Web_Penup_Search_Rusults}
    
Verify Category Lists Dispaly
    Log To Console    Verify Category Lists Dispaly
    Wait Until Element Is Visible    ${Web_Penup_Penup_Category}
    
Click Main Menu
    [Arguments]    ${menu}
    Log To Console    Click Main Menu
    ${menu_tab}    Replace String    ${Web_Penup_Menu_loc}    ****    ${menu}
    ${menu_actived}    Replace String    ${Web_Penup_Menu_Actived_loc}    ****    ${menu}
    
    Click Element    ${menu_tab}    
    Wait Until Element Is Visible    ${menu_actived}