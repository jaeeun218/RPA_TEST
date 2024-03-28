*** Settings ***
Resource    ../Resource.robot

Suite Setup    Run Keywords    Connect to Device    ${DEVICE_ID}
...    AND    Stop Application    ${GALAXYSTORE_PACKAGE}

*** Test Cases ***
Test_Cases_1
    [Documentation]    Test_Cases_1_INPUT_DATA
    [Setup]    Open Application    ${GALAXYSTORE_ACTIVITY}
    [Teardown]    Stop Application    ${GALAXYSTORE_PACKAGE}
    Verify Galaxy Store Main Display
    
    Click Search Button
    Input Search Text    ${SEARCH_DATA}
    
    Click Result Item    ${GalaxyStore_SamsungFree_Title}[0]    ${GalaxyStore_SamsungFree_Title}[1]
    Veify Result Item Page    ${GalaxyStore_SamsungFree_Detail_Title}[0]    ${GalaxyStore_SamsungFree_Detail_Title}[1]

Test_Cases_2
    [Documentation]    Test_Cases_2_COMPARE_DATA
    [Setup]    Open Application    ${GALAXYSTORE_ACTIVITY}
    [Teardown]    Stop Application    ${GALAXYSTORE_PACKAGE}
    Verify Galaxy Store Main Display
    
    Click Bottom Tap
    Click Category More Button
    
    Verify Category Page Display
    Verify Compare Popular Category Name Display

Test_Cases_3
    [Documentation]    Test_Cases_3_GET_DATA
    [Setup]    Open Application    ${GALAXYSTORE_ACTIVITY}
    [Teardown]    Stop Application    ${GALAXYSTORE_PACKAGE}
    Verify Galaxy Store Main Display
    
    Get Game Name
    Click Game Item

Test_Cases_4
    [Documentation]    Test_Cases_3_INSTALL&UNINSTALL_APP
    [Setup]    Run Keywords    Check Installed Applications    ${SAMSUNGFREE_PACKAGE}
    ...    AND    Open Application    ${GALAXYSTORE_ACTIVITY}
    [Teardown]    Run Keywords    Stop Application    ${GALAXYSTORE_PACKAGE}
    ...    AND    Delete Application    ${SAMSUNGFREE_PACKAGE}
    Verify Galaxy Store Main Display
    
    Click Search Button
    Input Search Text    ${SEARCH_DATA}
    
    Click Result Item    ${GalaxyStore_SamsungFree_Title}[0]    ${GalaxyStore_SamsungFree_Title}[1]
    Veify Result Item Page    ${GalaxyStore_SamsungFree_Detail_Title}[0]    ${GalaxyStore_SamsungFree_Detail_Title}[1]
    
    Click Install Button
    Verify Installed Application Display    ${SAMSUNGFREE_PACKAGE}
