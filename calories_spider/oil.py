from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import Select
from selenium.webdriver.common.by import By

# 初始化webdriver
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))

# 打開網頁
driver.get("http://211.21.168.52/FOOD/%AAo%C3%FE.htm")

# 等待頁面加載
driver.implicitly_wait(5)

# 定位到您需要开始提取数据的table元素
data_table_xpath = '/html/body/div/table/tbody/tr/td/div[3]/table/tbody/tr/td/div/table/tbody'
data_table = driver.find_element(By.XPATH, data_table_xpath)

# 定位到除了第一行标题以外的所有数据行
data_rows = data_table.find_elements(By.XPATH, './tr[position()>1]')

# 遍历所有数据行
for row in data_rows:
    # 获取这一行的所有列<td>元素
    cols = row.find_elements(By.TAG_NAME, 'td')
    
    # 确保每个<tr>都有足够的<td>元素
    if len(cols) >= 4:
        # 提取相关的数据
        item_name = cols[0].text.strip()
        unit = cols[1].text.strip()
        weight = cols[2].text.strip()
        calories = cols[3].text.strip()
        
        # 打印或处理数据
        print(f"{item_name}, {unit}, {weight}, {calories}")

# 完成後關閉driver
driver.quit()

# 注意注意!!
# 一個正常人一天所需熱量大約是1500-2000卡(卡路里)
