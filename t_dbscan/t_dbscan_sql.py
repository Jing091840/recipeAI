# t_kmeans_sql.py
import pandas as pd
import numpy as np

np.random.seed(42)  # 为了可重现性

# 偏好分数映射，这里我们预先定义一个基础的偏好映射，稍后将会为每个用户打乱它
base_preference_scores = {'雞肉': 1, '海鮮': 2, '素食': 3, '牛肉': 0, '豬肉': 0}
calories_options = ['高熱量', '低熱量']
ingredients_range = ['small', 'medium', 'large', 'master']

def generate_user_preference(user_id, n_records=100):
    # 随机打乱肉类的偏好顺序
    categories = list(base_preference_scores.keys())
    preferences = list(base_preference_scores.values())
    user_preferences = dict(zip(categories, np.random.permutation(preferences)))

    # 随机生成卡路里的偏好分数
    calorie_preference_scores = np.random.choice([1, 2], size=2, replace=False)
    calorie_preferences = dict(zip(calories_options, calorie_preference_scores))
    
    # 随机生成食材数量的偏好分数
    ingredients_preference_scores = np.random.choice([1, 2, 3, 4], size=4, replace=False)
    ingredients_preferences = {i: score for i, score in zip(ingredients_range, ingredients_preference_scores)}
    
    # 生成用户数据
    categories_data = np.random.choice(categories, size=n_records)
    calories_data = np.random.choice(calories_options, size=n_records)
    ingredients_data = np.random.choice(ingredients_range, size=n_records)

    preference_data = []
    for category, calorie, ingredient in zip(categories_data, calories_data, ingredients_data):
        preference = user_preferences[category]  # 肉类偏好
        
        # 加入卡路里偏好
        preference += calorie_preferences[calorie]
        
        # 加入食材数量偏好
        for threshold, score in ingredients_preferences.items():
            if ingredient == threshold:
                preference += score
                break
        
        # 确保偏好得分在1到5之间
        preference = max(1, min(preference, 5))
        preference_data.append(preference)

    # 创建DataFrame
    return pd.DataFrame({
        'user_id': [user_id] * n_records,
        'category': categories_data,
        'calories': calories_data,
        'ingredients': ingredients_data,
        'preference': preference_data
    })


# 生成所有用户的数据
all_users_data = pd.concat([generate_user_preference(user_id) for user_id in range(1000)])

# 保存到CSV文件
all_users_data.to_csv('t_dbscan_sql.csv', index=False, encoding='utf-8')