# r_search_name.py
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",  
    user="calorie",  
    password="",  
    database="cal" 
)

name_to_find = input("請輸入食譜名稱: ")

cursor = conn.cursor()
cursor.execute("SELECT * FROM recipes WHERE r_name = %s", (name_to_find,))

row = cursor.fetchone()
if row:

    recipe_name = row[0]
    print("食譜：")
    print("   ",row[0])

    # 時間
    print("烹飪時間：")
    if row[1] != 0:
        print("   ",row[1],"分鐘")
    else:
        print("    計算中")


    cursor.execute("SELECT * FROM ing_info WHERE i_name = %s", (recipe_name,))
    ingredients_row = cursor.fetchone()

    # 食材
    print("食材:")
    if ingredients_row:
        ingredients = [ingredient.strip() for ingredient in ingredients_row[1:] if ingredient]  # 去除每个食材两端的空格，并过滤掉空值
        ingredients_str = ", ".join(ingredients)
        print("   ",ingredients_str)  # 使用逗号加空格作为分隔符，将食材连成一串字符串后打印
    else:
        print("    努力維修中，請稍後(ง •̀_•́)ง")

    # 步驟
    print("步驟：")
    if row[2] != "null":
        print("   ",row[2])
    else:
        print("    加入會員即可觀看!")

else:
    print("目前沒有相關食物>_<") 

# 關閉游標
cursor.close()
# 關閉與數據庫的連接
conn.close()