import subprocess
import xml.etree.ElementTree as ET
import re
import time
from uiautomator import device as d


def find_element(resource_id, text=None, index=None):
    if text:
        return d(resourceId=resource_id, text=text)
    if index:
    	return d(resourceId=resource_id, index=index)
    else:
        return d(resourceId=resource_id)
	


def click_object(resource_id,text=None,timeout=5):
    element = find_element(resource_id, text)
    
    if not element.wait.exists(timeout=timeout):
        raise AssertionError(f"Element with resource ID '{resource_id}' not found.")
    
    element.click()
    
def wait_for_object(resource_id,text=None, timeout=20):
    element = find_element(resource_id, text)
    
    if not element.wait.exists(timeout=timeout):
        raise AssertionError(f"Element with resource ID '{resource_id}' not found.")
    return element

def scroll_to_element(resource_id, text=None, max_swipe_attempts=10):
    # 최대 스크롤 시도 횟수
    for _ in range(max_swipe_attempts):
        element = find_element(resource_id, text)
        
        time.sleep(2)
        if element.exists:  # 요소가 화면에 있으면
            return  # 스크롤이 필요하지 않음
        
        # 요소가 화면에 없으면 화면을 스크롤
        d.swipe(500, 1500, 500, 500)
        time.sleep(2)
    
    # 최대 시도 횟수 이후에도 요소가 없으면 오류 발생
    raise AssertionError(f"Element with XPath '{resource_id}' not found after scrolling.")

def input_text(resource_id, text):
    element = find_element(resource_id)
    if not element.exists:
        raise AssertionError(f"Element with resource ID '{resource_id}' not found.")
    
    element.clear_text()  # 입력란을 클리어
    element.set_text(text)  # 텍스트 입력
    
def get_text(resource_id):
    element = d(resourceId=resource_id)
    if not element.exists:
        raise AssertionError(f"Element with resource ID '{resource_id}' not found.")
    return element.text

try:
    text = get_text("com.example.app:id/textView")
    print("Text:", text)
except AssertionError as e:
    print("AssertionError:", e)


