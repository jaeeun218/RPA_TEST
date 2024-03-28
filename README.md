# :bulb: 소개
Selenium과 UIAutomator를 사용하여 자동화 프로젝트를 진행하였습니다. 

프로젝트는 직접 자동화 스크립트를 작성하여 구성하였습니다.

프로젝트 역할면에서 테스트케이스 작성, 자동화 스크립트 작성 및 배포 및 유지관리를 맡았습니다.


# :wrench: 기술 스택
> **RED IDE** ver.0.9.5    
> **Python** ver.3.12.2    
> **JDK** ver.1.8.0_401    
> **Robotframework** ver.3.2.2    
> **uiautomator** ver.1.0.2    
> **uiautomator2** ver.2.16.25    
> **SeleniumLibrary** ver.6.2.0       


# :memo: 프로젝트
## :computer: [WEB] Penup
### 1. Library
    *** Settings ***   
    Library    SeleniumLibrary   
    Library    Collections   
    Library    String   
    Library    RequestsLibrary   

### 2. 주요 기능
>  1. 웹 페이지에서 이미지와 해당 세부 정보 페이지를 확인합니다.
>
> 
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

> 2. 검색 아이콘을 클릭하여 검색 데이터를 입력하고 결과를 확인합니다.
>
> 

    Test_Cases_2
    [Documentation]    Test_Cases_2_INPUT_DATA
    Go To    ${PENUP_URL}
    Verify Penup MainPage Display
    
    Click Search Icon
    
    Input Search Data    ${Web_Penup_Search_Data}
    Verify Search Data Result Display

> 3. 검색 아이콘을 클릭하고 카테고리 목록을 확인하여 카테고리 이름을 비교합니다.
>
> 

    Test_Cases_3
    [Documentation]    Test_Cases_3_COMPARE_DATA
    Go To    ${PENUP_URL}
    Verify Penup MainPage Display
    
    Click Search Icon
    
    Verify Category Lists Dispaly
    
    Verify Compare Category Name Display

> 4. 웹페이지의 이미지가 정상적으로 노출되는지 세션을 가져와 검증하는 테스트입니다.
>
> 

    Test_Cases_4
    [Documentation]    Test_Cases_4_RESPONSE_IMAGE
    Go To    ${PENUP_URL}
    Verify Penup MainPage Display
    
    Click Main Menu    ${PENUP_MENU}[0]
    Verify Penup Artwork Image Display
    
    Get On Session Of Penup Image



## :iphone: [APP] Galaxy Store
### 1. Library
    *** Settings ***
    Library    Collections
    Library    String
    Library    RequestsLibrary
    Library    uiautomator
    Library    uiautomator2
    Library    OperatingSystem
    Library    uiautomatorLibrary

### 2. UIAutomatorLibrary
1. Python으로 직접 개발한 UIAutomatorLibrary입니다.
2. 이 라이브러리는 안드로이드 애플리케이션의 UI 요소를 자동화하는 데 사용됩니다.
3. 주요 키워드는 다음과 같습니다:
  
>> **Find Element** : 리소스 ID를 찾습니다.   
>> **Click Object** : 리소스 ID를 클릭합니다.    
>> **Wait For Object** : 리소스 ID가 나타날 때까지 기다립니다.    
>> **Scroll To Object** : 리소스 ID를 찾을 때까지 스크롤합니다.    
>> **Input Text** : 리소스 ID에 데이터를 입력합니다.     
>> **Get Text** : 리소스 ID의 텍스트를 가져옵니다.    


### 3. 주요 기능
> 1. 애플리케이션에서 검색을 수행하고 결과를 확인하는 과정을 자동으로 수행하여 애플리케이션의 정상 작동 여부를 확인합니다.
>
> 
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

> 2. 카테고리 페이지를 열고 인기 카테고리의 이름이 올바르게 표시되는지를 확인하여 정상 작동 여부를 검증합니다.
>
> 
    Test_Cases_2
        [Documentation]    Test_Cases_2_COMPARE_DATA
        [Setup]    Open Application    ${GALAXYSTORE_ACTIVITY}
        [Teardown]    Stop Application    ${GALAXYSTORE_PACKAGE}
        Verify Galaxy Store Main Display
    
        Click Bottom Tap
        Click Category More Button
    
        Verify Category Page Display
        Verify Compare Popular Category Name Display
    

> 3. 애플리케이션에서 게임 이름을 가져오고 해당 게임을 클릭하여 상세페이지로 이동하는 과정을 자동화합니다.
>
>    
    Test_Cases_3
        [Documentation]    Test_Cases_3_GET_DATA
        [Setup]    Open Application    ${GALAXYSTORE_ACTIVITY}
        [Teardown]    Stop Application    ${GALAXYSTORE_PACKAGE}
        Verify Galaxy Store Main Display
    
        Get Game Name
        Click Game Item
        
> 4. 특정 앱을 검색하여 설치하고, 설치된 앱이 정상적으로 표시되는지 확인한 후 앱을 제거하는 과정을 자동화합니다.
>
> 

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




