*** Settings ***
Resource    ../Resource.robot

*** Variables ***
${PENUP_URL}    https://penup.com/
${Web_Penup_Search_Data}    love
@{PENUP_CATEGORY}    모든 콘텐츠     여행     식물     동물     음식     건축     패션     제품     인물     스포츠
...     운송기기    유머     캐릭터     컨셉아트     만화     풍경     정물화     추상화     순수미술
...       텍스트 아트     드로잉 팁     낙서     라이브 드로잉     컬러링     배경화면     기타
${category}    ${EMPTY}
@{PENUP_MENU}    홈    컬러링    라이브 드로잉    챌린지    명예의 전당
${Attribute_Style}    style
${BROWSER_CHROME}    chrome