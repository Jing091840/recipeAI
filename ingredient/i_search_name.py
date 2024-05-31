# i_search_name.py
import mysql.connector  # 導入mysql.connector模塊

# 建立與MySQL數據庫的連接
conn = mysql.connector.connect(
    host="localhost",  # 指定數據庫服務器地址為本地主機
    user="calorie",  # 指定登入用戶名為calorie
    password="",  # 指定登入密碼（這裡沒有給出）
    database="cal"  # 指定要連接的數據庫名稱為cal
)

# 提示用戶輸入要查找的食物名稱
name_to_find = input("請輸入要查找的食材: ")

# 創建一個游標對象，用於執行SQL語句
cursor = conn.cursor(buffered=True)

# 執行SQL查詢，查找用戶輸入名稱的食物
cursor.execute("SELECT * FROM cal_info WHERE c_name = %s", (name_to_find,))

# 從查詢結果中獲取第一筆記錄
row = cursor.fetchone()
if row:
    ingredient_name = row[1]
    calories = row[4]
    category = row[5]
    print("食材：", ingredient_name)
    print( "熱量：", calories,"卡")

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

    # 打印包含该食材的食譜
    recipes = cursor.fetchall()
    print("包含", ingredient_name, "的食譜：")

    if recipes:
        for recipe in recipes:
            print(recipe[0])
    else:
        print("    目前沒有相關食譜>_<")
else:
    print("    目前沒有相關食物>_<")  # 如果沒有找到記錄，則輸出提示信息
    

# 關閉游標
cursor.close()
# 關閉與數據庫的連接
conn.close()
