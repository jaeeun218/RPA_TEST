*** Settings ***
Resource    ../Resource.robot

*** Keywords ***
Click Install Button
    Log To Console    Click Install Button
    Click Object    ${GalaxyStore_App_Install_Button}
    
Verify Installed Application Display
    [Arguments]    ${app}
    Log To Console    Verify Installed Application Display
    FOR    ${index}    IN RANGE    ${100}
        ${app_list}    Run    adb shell pm list packages | findstr "${app}"
        ${wait}    Run Keyword And Return Status    Should Contain    ${app_list}    ${app}
        Run Keyword If    ${wait}    Exit For Loop
        Run Keyword Unless    ${wait}    Sleep    1s
    END
    Run Keyword Unless    ${wait}    Fail    fail to install app.
    
Check Installed Applications
    [Arguments]    ${app}
    Log To Console    Check Installed Applications
    ${app_list}    Run    adb shell pm list packages | findstr "${app}"
    ${status}    Run Keyword And Return Status    Should Contain    ${app_list}    ${app}
    Run Keyword If    ${status}    Delete Application    ${app}

Delete Application
    [Arguments]    ${app}
    Log To Console    Delete Application : ${app}
    ${status}    Run    adb uninstall ${app}
    FOR    ${index}    IN RANGE    ${100}
        ${wait}    Run Keyword And Return Status    Should Be Equal    ${status}    Success
        Run Keyword If    ${wait}    Exit For Loop
    END
    Run Keyword Unless    ${wait}    Fail    fail to delete app.

Get Game Name
    Log To Console    Get Game Name
    Sleep    5s
    ${item_name}    uiautomatorLibrary.Get Text    ${GalaxyStore_Item_Name}
    Log To Console    Game : [${item_name}]
    ${item_name}    Set Suite Variable    ${item_name}
    
Click Game Item
    Log To Console    Click Game Item
    Click Object    ${GalaxyStore_Item_Name}    ${item_name} 
    Wait For Object    ${GalaxyStore_App_Name}
    ${app_name}    uiautomatorLibrary.Get Text    ${GalaxyStore_App_Name}
    Should Be Equal    ${item_name}    ${app_name}
    
Verify Galaxy Store Main Display
    Log To Console    Verify Galaxy Store Main Display
    Sleep    2s
    ${status}    Run Keyword And Return Status    Wait For Object    ${GalaxyStore_DoNotShowAgain}    timeout=5
    Run Keyword If    ${status}    Click Object    ${GalaxyStore_DoNotShowAgain}
    Wait For Object    ${GalaxyStore_Logo}
    
Click Search Button
    Log To Console    Click Search Button
    Wait For Object    ${GalaxyStore_search_button}
    Click Object    ${GalaxyStore_search_button}
    
Input Search Text
    [Arguments]    ${data}
    Log To Console    Input Search Text : [${data}]
    Wait For Object    ${GalaxyStore_search_input}
    uiautomatorLibrary.Input Text    ${GalaxyStore_search_input}    ${data}
    Press Enter Key
    
Click Result Item
    [Arguments]    ${loc_src}    ${loc_txt}
    Log To Console    Click Result Item
    Sleep    2s
    Scroll To Element    ${loc_src}    ${loc_txt}
    Click Object    ${loc_src}    ${loc_txt}
    
Veify Result Item Page
    [Arguments]    ${loc_src}    ${loc_txt}
    Log To Console    Veify Result Item Page
    Sleep    2s
    Wait For Object    ${loc_src}    ${loc_txt}
    
Click Bottom Tap
    Log To Console    Click Bottom Tap : [${GalaxyStore_Bottom_App}[1]]
    Click Object    ${GalaxyStore_Bottom_App}[0]    ${GalaxyStore_Bottom_App}[1]
    
Click Category More Button
    Log To Console    Click Category More Button
    Scroll To Object And Click    ${GalaxyStore_Popular_Category}[0]    ${GalaxyStore_Popular_Category}[1]
    
Scroll To Object And Click
    Log To Console    Scroll To Object And Click
    [Arguments]    ${loc_src}    ${loc_txt}
    Scroll To Element    ${loc_src}    ${loc_txt}
    Click Object    ${loc_src}    ${loc_txt}
    
Verify Category Page Display
    Log To Console    Verify Category Page Display
    Wait For Object    ${GalaxyStore_Popular_Category_Detail_Title}[0]    ${GalaxyStore_Popular_Category_Detail_Title}[1]

Get Popular Category Name
    Log To Console    Get Popular Category Name
    ${category}    Create List
    ${length}    Get Length    ${GalaxyStore_Actual_Category_List}
    
    FOR    ${num}    IN RANGE    ${length}
        ${category_name}    Set Variable     ${GalaxyStore_Actual_Category_List}[${num}]
        ${status}    Run Keyword And Return Status    Wait For Object    ${GalaxyStore_Popular_Category_Detail_Name}    ${category_name}    timeout=3
        Run Keyword Unless    ${status}    Scroll To Element    ${GalaxyStore_Popular_Category_Detail_Name}    ${category_name}
        Wait For Object    ${GalaxyStore_Popular_Category_Detail_Name}    ${category_name}
        Append To List    ${category}    ${category_name}
        
    END
    Log To Console    ${category}
    ${category}    Set Suite Variable    ${category}

Verify Compare Popular Category Name Display
    Log To Console    Verify Compare Category Name Display
    Get Popular Category Name
    Should Be Equal    ${category}    ${GalaxyStore_Actual_Category_List}
    

###########################################################
Connect to Device
    [Documentation]    Connects to the Device
    [Arguments]    ${device}
    Log To Console    Connect to Device : [${device}]
    Run    adb connect ${device}

Open Application
    [Documentation]    Open Application
    [Arguments]    ${package}
    Log To Console    Open Application : [${package}]
    Run    adb shell am start -n ${package}

Stop Application
    [Documentation]    Stop Application
    [Arguments]    ${package}
    Log To Console    Stop Application : [${package}]
    Run Keyword And Ignore Error    Run    adb shell am force-stop ${package}

Press Enter Key
    [Documentation]    Press Enter Key
    Log To Console    Press Enter Key
    Run    adb shell input keyevent KEYCODE_ENTER
