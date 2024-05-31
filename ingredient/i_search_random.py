# i_search_random.py
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",  
    user="calorie",  
    password="",  
    database="cal" 
)

name_to_find = input("請按下確認鍵抽取食材")

# 隨機選擇一個食材
cursor = conn.cursor()
cursor.execute("SELECT * FROM cal_info ORDER BY RAND() LIMIT 1")
ingredient_row = cursor.fetchone()
ingredient_name = ingredient_row[1]
calories = ingredient_row[4]
category = ingredient_row[5]
print("食材：", ingredient_name)
print("熱量：", calories,"卡")

category_mapping = {
        "grains": "五穀根莖類",
        "fruit": "水果類",
        "vegetable": "蔬菜類",
        "milk": "乳制品",
        "bean": "豆制品",
        "egg": "蛋類",
        "oil": "油脂類",
        "sauce": "調料",
        "wine": "酒類",
        # 肉
        "seafood": "海鲜類",
        "poultry": "家禽類",
        "beef": "牛肉",
        "mutton": "羊肉",
        "pork": "豬肉",
        "other": "其他"
    }

english_category = category  
chinese_category = category_mapping.get(english_category, english_category)

print("類別：", chinese_category)


# 查找包含該食材的所有食譜
query = (
    "SELECT r_name FROM recipes "
    "JOIN ing_info ON recipes.r_name = ing_info.i_name "
    "WHERE ing1 = %s OR ing2 = %s OR ing3 = %s OR ing4 = %s OR "
    "ing5 = %s OR ing6 = %s OR ing7 = %s OR ing8 = %s OR "
    "ing9 = %s OR ing10 = %s OR ing11 = %s OR ing12 = %s OR "
    "ing13 = %s OR ing14 = %s OR ing15 = %s OR ing16 = %s OR "
    "ing17 = %s OR ing18 = %s OR ing19 = %s"
)
# 填充查询中的所有参数
cursor.execute(query, [ingredient_name]*19)
recipes = cursor.fetchall()
print("包含", ingredient_name, "的食譜：")
# 打印包含该食材的食譜
if recipes:
    for recipe in recipes:
        print(recipe[0])
else:
    print("    目前沒有相關食物>_<")


# 關閉游標
cursor.close()
# 關閉與數據庫的連接
conn.close()

