*** Settings ***
Resource    ../Resource.robot

*** Variables ***
${GalaxyStore_Logo}    com.sec.android.app.samsungapps:id/mainpage_galaxy_store_logo
${GalaxyStore_more_button}    com.sec.android.app.samsungapps:id/iv_more
${GalaxyStore_search_button}    com.sec.android.app.samsungapps:id/actionbar_search_icon
${GalaxyStore_search_input}    android:id/search_src_text
${GalaxyStore_ScrollView}    com.sec.android.app.samsungapps:id/content_list
${GalaxyStore_DoNotShowAgain}    com.sec.android.app.samsungapps:id/do_not_show_again_area_text
@{GalaxyStore_Bottom_App}    com.sec.android.app.samsungapps:id/tab_item_name    앱
@{GalaxyStore_SamsungFree_Title}    com.sec.android.app.samsungapps:id/layout_list_itemly_centerly_pname    Samsung Free
@{GalaxyStore_SamsungFree_Detail_Title}    com.sec.android.app.samsungapps:id/tv_detail_main_product_name    Samsung Free
@{GalaxyStore_Popular_Category}    com.sec.android.app.samsungapps:id/list_text_title    인기 카테고리
@{GalaxyStore_Popular_Category_Detail_Title}    com.sec.android.app.samsungapps:id/actionbar_title    카테고리
${GalaxyStore_Popular_Category_Detail_Name}    com.sec.android.app.samsungapps:id/category_name
${GalaxyStore_Item_Name}    com.sec.android.app.samsungapps:id/layout_list_itemly_centerly_pname
${GalaxyStore_App_Name}    com.sec.android.app.samsungapps:id/tv_detail_main_product_name
${GalaxyStore_App_Install_Button}    com.sec.android.app.samsungapps:id/btn_detail_install
@{GalaxyStore_App_Installed_Button}    com.sec.android.app.samsungapps:id/tv_detail_install_reduce_price    실행