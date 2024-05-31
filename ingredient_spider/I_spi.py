# i_spi.py

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time
import re
import csv


# 指定 ChromeDriver 的路径
chrome_driver_path = 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe'  # 替换为您的实际路径

# 创建 ChromeOptions 对象并指定 ChromeDriver 路径
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument(f"webdriver.chrome.driver={chrome_driver_path}")

# 启动 Chrome 浏览器
driver = webdriver.Chrome(options=chrome_options)

# recipe_id = 123

with open('ingredient.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    # 写入标题行
    writer.writerow(['r_id'] + ['i_name'] + [f'ing{i+1}' for i in range(19)])
    # 循环遍历从第1页到第20页
    for i in range(1, 21):
        # 构造每一页的URL
        page_url = f"https://icook.tw/search/%E7%98%A6%E8%BA%AB/?page={i}&order=latest#search-header"
        driver.get(page_url)

        # 等待页面加载
        time.sleep(2)  # 根据你的网络速度调整等待时间

        # 获取所有菜名和食材的容器
        containers = driver.find_elements(By.CSS_SELECTOR, 'article')

        # 遍历每个容器，获取菜名和食材
        for container in containers:
            try:
                # 获取爱心数
                love_count_element = container.find_element(By.CSS_SELECTOR, 'i.icon-heart-regular').find_element(By.XPATH, '..')
                love_count = int(love_count_element.get_attribute('data-title').split(' ')[0])
                
                # 如果爱心数超过10，继续处理
                if love_count > 10:
                    # 获取菜名
                    h2_tag = container.find_element(By.CSS_SELECTOR, 'h2.browse-recipe-name')
                    recipe_name = h2_tag.text.strip()

                    # 获取食材，并去除 "食材：" 前缀
                    p_tag = container.find_element(By.CSS_SELECTOR, 'p.browse-recipe-content-ingredient')
                    ingredients_text = p_tag.text.strip().replace('食材：', '')

                    # 使用正则表达式移除括号及其内容，包括中文圆括号
                    ingredients_text = re.sub(r'[\(\（].*?[\)\）]', '', ingredients_text)

                    # 将食材文本分割为列表
                    ingredients_list = ingredients_text.split('、')
                    ingredients_list = ingredients_list + ['NULL'] * (19 - len(ingredients_list))  # 用'NULL'填充

                    # 将菜名和食材列表写入CSV文件，如果食材不足19个，用空字符串填充
                    writer.writerow([recipe_name] + ingredients_list)
                    # writer.writerow([recipe_id] + [recipe_name] + ingredients_list)

                    # recipe_id += 1

            except Exception as e:
                # 如果找不到标签或出现其他错误，打印错误信息
                print('Error finding recipe or ingredients within the container', e)
        # 等待新页面加载
        time.sleep(2)  # 根据你的网络速度调整等待时间

# 关闭浏览器
driver.quit()




# 直接爬到最後一頁

# current_page = 1

# while True:
#     # 构造每一页的URL
#     page_url = f"https://icook.tw/search/%E7%98%A6%E8%BA%AB/?page={current_page}&order=latest#search-header"
#     driver.get(page_url)

#     # 等待页面加载
#     wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, 'article')))

# ...

#     # 尝试找到并点击“下一页”按钮
#     try:
#         next_button = wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, 'li.pagination-tab.page--next')))
#         next_button.click()
#         current_page += 1
#     except NoSuchElementException:
#         print("No more pages to load.")
#         break


