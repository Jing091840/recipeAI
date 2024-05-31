# t_gru_sql.py
import pandas as pd
import numpy as np

# 設定隨機種子以確保結果的可重現性
np.random.seed(42)

# 定義參數
n_samples = 10000  # 生成樣本數量
categories = ['牛肉', '豬肉', '雞肉', '海鮮', '素食']
calories = ['高熱量', '低熱量']
preference = [1, 2, 3, 4, 5]
ingredients= [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
# 參數比重
categories_weights = [1, 1, 1, 1, 1]  # 分別對應牛肉、豬肉、雞肉、海鮮、素食的比重
calories_weights = [1, 1]  # 分別對應高熱量、低熱量的比重
ingredients_weights= [1]*20


# 生成隨機數據

categories_data= np.random.choice(categories, size=n_samples, p=np.array(categories_weights) / sum(categories_weights))
calories_data= np.random.choice(calories, size=n_samples, p=np.array(calories_weights) / sum(calories_weights))
ingredients_data= np.random.choice(ingredients, size=n_samples, p=np.array(ingredients_weights) / sum(ingredients_weights))


preference_data=[]
for categories, calories ,ingredients in zip(categories_data, calories_data, ingredients_data):
    preference = 0  # 偏好基礎分數
    if categories == '雞肉':
        preference+=1
    elif categories =='海鮮':
        preference+=2
    elif categories =='素食':
        preference+=3

    if calories =='高熱量':
        preference+=1
    elif calories =='低熱量':
        preference+=2

    if ingredients <= 5:
        preference+=1
    elif ingredients <= 10:
        preference+=2
    elif ingredients <= 15:
        preference+=3
    elif ingredients <= 20:
        preference+=4

    # 确保偏好得分在1到5之间
    preference = max(1, min(preference, 5))
    preference_data.append(preference)


# 轉換為DataFrame
df = pd.DataFrame({
    'category': categories_data,
    'calories': calories_data,
    'ingredients': ingredients_data,
    'preference': preference_data
})


# 保存到CSV文件
df.to_csv('t_gru_sql.csv', index=False, encoding='utf-8')

