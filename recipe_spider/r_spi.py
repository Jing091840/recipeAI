# r_spi.py

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import TimeoutException
import re
import time
import csv

# 指定 ChromeDriver 的路徑
chrome_driver_path = 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe'  # 替換為實際路徑

# 創建 ChromeOptions 對象並指定 ChromeDriver 路徑
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument(f"webdriver.chrome.driver={chrome_driver_path}")

# 啟動 Chrome 瀏覽器
driver = webdriver.Chrome(options=chrome_options)

# recipe_id = 1

with open('recipes.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['r_id', 'r_name', 'r_time', 'r_step'])
    # 循環遍歷從第1頁到第20頁
    for i in range(1, 21):
        # 構造每一頁的URL
        page_url = f"https://icook.tw/search/%E7%98%A6%E8%BA%AB/?page={i}&order=latest#search-header"
        driver.get(page_url)

        # 等待菜名元素加載10s
        wait = WebDriverWait(driver, 10)
        recipe_links = wait.until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, 'a.browse-recipe-link')))

        # 獲取所有菜名的鏈接
        recipe_hrefs = [link.get_attribute('href') for link in recipe_links]


        # 對於每個菜名的鏈接
        for href in recipe_hrefs:
            # 打開菜名鏈接
            driver.get(href)
            
            # 初始化變量
            step_texts = []
            recipe_name = ""
            
            try:
                # 等待爱心数元素加载
                love_count_element = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, 'span.stat-content')))
                # 使用正则表达式提取数字
                love_count_text = love_count_element.text.replace(',', '')
                # 检查是否有“万”字单位
                love_count_matches_wan = re.search(r'(\d+(\.\d+)?)万', love_count_text)
                if love_count_matches_wan:
                    # 如果有“万”，转换成整数
                    love_count = float(love_count_matches_wan.group(1)) * 10000
                else:
                    # 否则，按原来的方法处理
                    love_count_matches = re.search(r'\d+', love_count_text)
                    love_count = int(love_count_matches.group(0)) if love_count_matches else 0
    
                    # 如果愛心數大於10
                    if love_count > 10:

                        # 提取食譜名稱
                        recipe_name_element = wait.until(EC.presence_of_element_located((By.ID, 'recipe-name')))
                        recipe_name = recipe_name_element.text.strip()

                        # 提取烹飪時間
                        try:
                            time_element = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, '.time-info .info-content .num')))
                            recipe_time = time_element.text.strip()
                        except (TimeoutException, NoSuchElementException):
                            recipe_time = "null"


                        # 等待食譜步驟元素加載
                        # 在將文本添加到步驟列表之前，替換掉換行符
                        try:
                            steps_elements = wait.until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, '.recipe-step-description-content')))
                            step_texts = ', '.join([step.text.replace('\n', ' ').strip() for step in steps_elements])
                        except TimeoutException:
                            step_texts = "null"
                        
                    pass
                    # else:
                        # print(f"食譜 {href} 的愛心數未超過10。")
            except TimeoutException:
                # 处理元素未找到的异常
                pass


            except NoSuchElementException as e:
                print(f"跳過食譜 {href}, 無法找到必要信息。原因: {e}")
                continue
            except ValueError as e:
                print(f"在食譜 {href} 中找到的愛心數格式不正確: {love_count_text}。原因: {e}")

            if step_texts:
                writer.writerow([recipe_name, recipe_time, step_texts])

                step_texts = []
                # recipe_id += 1
            # 等待新頁面加載
        time.sleep(2)  # 根據你的網絡速度調整等待時間


# 關閉瀏覽器
driver.quit()
