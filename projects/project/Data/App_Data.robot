*** Settings ***
Resource    ../Resource.robot

*** Variables ***
${DEVICE_ID}    R3CX10KDW7K
${GALAXYSTORE_PACKAGE}    com.sec.android.app.samsungapps
${SAMSUNGFREE_PACKAGE}    com.samsung.android.app.spage
${GALAXYSTORE_ACTIVITY}    com.sec.android.app.samsungapps/com.sec.android.app.samsungapps.SamsungAppsMainActivity

@{GalaxyStore_Actual_Category_List}    도구     여행    소셜 미디어    음악    맞춤 설정    오피스     사진     글꼴    책    라이프스타일     어린이    동영상    시스템 관리    금융
...    쇼핑     교육    교통수단    건강
${category}    ${EMPTY}
${SEARCH_DATA}    free
${item_name}    ${EMPTY}