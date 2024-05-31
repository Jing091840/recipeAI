import pandas as pd
import random

# 食物偏好選項
categories_options = ['beef', 'pork', 'poultry', 'seafood', 'vegan']
calories_options = ['high_cal', 'low_cal']
ingredients_options = ['small', 'medium', 'large', 'master']
cooktimes_options = ['quick', 'normal', 'slow']

# 偏好分數配額
categories_preference_scores = [0, 0, 1, 2, 3]
calorie_preference_scores = [1, 2]
ingredients_preference_scores = [0, 1, 2, 3]
cooktimes_preference_scores = [0, 1, 2]

# 生成用户偏好
users_preferences = []
for _ in range(1):
    user_pref = {
        "categories": random.sample(categories_options, k=len(categories_options)), # k是列表长度
        "calories": random.sample(calories_options, k=len(calories_options)), # k是列表长度
        "ingredients": random.sample(ingredients_options, k=len(ingredients_options)), # k是列表长度
        "cooktimes": random.sample(cooktimes_options, k=len(cooktimes_options)), # k是列表长度
    }
    random_food_combinations = [{
    'category': random.choice(categories_options),
    'calories': random.choice(calories_options),
    'ingredients': random.choice(ingredients_options),
    'cooktime': random.choice(cooktimes_options)
} for _ in range(20)]
    users_preferences.append(user_pref)


# 重新分配偏好分数函数
def reallocate_preference_scores(user_pref, options, scores):
    # 创建原始排序和用户偏好排序的映射
    preference_order = {pref: idx for idx, pref in enumerate(user_pref)}
    return {option: scores[preference_order[option]] for option in options}

# 修改后的计算函数
def calculate_preference_score(user_preferences, food_combination, score_maps):
    # 根据配额映射计算偏好分数
    score = 0
    for attr in score_maps:
        score += score_maps[attr][food_combination[attr]]
    return score

# 修正：计算每位用户对于每种食物组合的偏好分数
all_users_scores = []
for user_id, user_pref in enumerate(users_preferences, start=0):
    # 为每个用户重新分配偏好分数
    score_maps = {
        'category': reallocate_preference_scores(user_pref['categories'], categories_options, categories_preference_scores),
        'calories': reallocate_preference_scores(user_pref['calories'], calories_options, calorie_preference_scores),
        'ingredients': reallocate_preference_scores(user_pref['ingredients'], ingredients_options, ingredients_preference_scores),
        'cooktime': reallocate_preference_scores(user_pref['cooktimes'], cooktimes_options, cooktimes_preference_scores),
    }
    
    user_scores = []
    for food_comb in random_food_combinations:
        score = calculate_preference_score(user_pref, food_comb, score_maps)
        score = max(1, min(score, 7))
        user_scores.append({
            'user_id': user_id,
            'category': food_comb['category'],
            'calories': food_comb['calories'],
            'ingredients': food_comb['ingredients'],
            'cooktimes': food_comb['cooktime'],
            'preference': score
        })
    all_users_scores.extend(user_scores)

# 创建DataFrame
df_all_users_scores = pd.DataFrame(all_users_scores)

# 保存到CSV文件
df_all_users_scores.to_csv('t_gru2_user_sql.csv', index=False, encoding='utf-8')

