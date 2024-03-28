*** Settings ***
Resource    ../Resource.robot

*** Variables ***
${CHROME_OPTIONS1}    add_experimental_option("detach", True)    
${Web_Penup_Search_Icon}    //div[@class="btn-search"]
${Web_Penup_MainPage_Icon}    //div[@class="penup-icon"]
${Web_Penup_Search_Input}    //input[@type="text"]
${Web_Penup_Penup_Category_loc}    (//div[@class="item-text"])[****]
${Web_Penup_Penup_Category}    //div[@class="item-text"]
${Web_Penup_Search_Rusults}    //div[@class="col text-right" and contains(text(), '결과를')]
${Web_Penup_Search_No_Rusult}    //div[@class="no-result" and text()='검색 결과가 없습니다']
${Web_Penup_Image}    //div[@class="artwork"]//div[@class="artwork-image"]
${Web_Penup_Detail_Image}    //img[@class="artwork-main-img"]
${Web_Penup_Menu_Actived_loc}    //li[@class="active"]/a[text()='****']
${Web_Penup_Menu_loc}    //li/a[text()='****']