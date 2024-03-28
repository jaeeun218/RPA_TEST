*** Settings ****
Resource    ../Resource.robot

*** Test Cases ***
Test_Cases_1
    [Documentation]    Test_Cases_1_CONFIRM_WEBPAGE
    Open Penup Browser
    
    Click Main Menu    ${PENUP_MENU}[0]
    Verify Penup Artwork Image Display
    
    Click Artwork Image
    Verify Artwork Image Detail Page Display
    
Test_Cases_2
    [Documentation]    Test_Cases_2_INPUT_DATA
    Go To    ${PENUP_URL}
    Verify Penup MainPage Display
    
    Click Search Icon
    
    Input Search Data    ${Web_Penup_Search_Data}
    Verify Search Data Result Display
    
Test_Cases_3
    [Documentation]    Test_Cases_3_COMPARE_DATA
    Go To    ${PENUP_URL}
    Verify Penup MainPage Display
    
    Click Search Icon
    
    Verify Category Lists Dispaly
    
    Verify Compare Category Name Display
    
Test_Cases_4
    [Documentation]    Test_Cases_4_RESPONSE_IMAGE
    Go To    ${PENUP_URL}
    Verify Penup MainPage Display
    
    Click Main Menu    ${PENUP_MENU}[0]
    Verify Penup Artwork Image Display
    
    Get On Session Of Penup Image
