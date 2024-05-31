# c_search_recipe.py
import mysql.connector

# 獲取用戶輸入的熱量範圍
min_cal = float(input("請輸入最小卡路里: "))
max_cal = float(input("請輸入最大卡路里: "))

# 與數據庫建立連接
conn = mysql.connector.connect(
    host="localhost",
    user="calorie",
    password="",
    database="cal"
)
cursor = conn.cursor()

# 獲得所有食材的熱量信息
cursor.execute("SELECT c_name, c_calorie FROM cal_info")
cal_info = {row[0]: row[1] for row in cursor.fetchall()}

# 獲得所有食譜
cursor.execute("SELECT i_name, ing1, ing2, ing3, ing4, ing5 FROM ing_info")
recipes = cursor.fetchall()

suitable_recipes = []
missing_ingredients = set()

for recipe in recipes:
    recipe_name = recipe[0]
    ingredients = recipe[1:]  # 排除掉食譜名稱，取得所有食材
    total_calories = 0.0
    recipe_missing_ingredients = []

    for ing in ingredients:
        if ing and ing in cal_info:
            # 假設每個食材的份量都是1份
            total_calories += cal_info[ing]
        elif ing:
            recipe_missing_ingredients.append(ing)
            missing_ingredients.add(ing)

    if min_cal <= total_calories <= max_cal:
        suitable_recipes.append((recipe_name, total_calories))

cursor.close()
conn.close()

# 打印結果
if suitable_recipes:
    print("以下為熱量範圍內的食譜：")
    for recipe, calories in suitable_recipes:
        print(f"{recipe}，總熱量：{calories} 大卡")
else:
    print("沒有找到合適的食譜。")

# # 打印出缺少食材的食譜信息
# if missing_ingredients:
#     print("\n以下食譜缺失的食材有:")
#     for recipe in recipes:
#         # 检查每个食谱的食材是否在missing_ingredients集合中
#         recipe_name = recipe[0]
#         ingredients = recipe[1:]
#         missing_ing_for_recipe = [ing for ing in ingredients if ing in missing_ingredients]
#         if missing_ing_for_recipe:
#             print(f"食譜 '{recipe_name}' 缺失的食材有: {', '.join(missing_ing_for_recipe)}")
# else:
#     print("所有食譜的食材都齊全。")
