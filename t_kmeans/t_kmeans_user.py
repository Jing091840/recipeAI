# t_kmeans_new_user.py
import pandas as pd
import numpy as np
import joblib

# 加载模型
kmeans = joblib.load('k_model.pkl')
encoder = joblib.load('k_encoder.pkl')
scaler = joblib.load('k_scaler.pkl')

# 新用户数据准备
new_user_data = pd.read_csv('t_kmeans_user_sql.csv')

# 将食材和烹饪时间分类映射到新的分组
def map_ingredients_to_group(ingredients):
    if ingredients == 'small':
        return 1
    elif ingredients == 'medium':
        return 2
    elif ingredients == 'large':
        return 3
    else:
        return 4

def map_cooktimes_to_group(cooktimes):
    if cooktimes == 'quick':
        return 1
    elif cooktimes == 'normal':
        return 2
    elif cooktimes == 'slow':
        return 3
    else:
        return 4

new_user_data['ingredients_group'] = new_user_data['ingredients'].apply(map_ingredients_to_group)
new_user_data['cooktimes_group'] = new_user_data['cooktimes'].apply(map_cooktimes_to_group)

# 对新用户的数据应用相同的预处理步骤（独热编码和标准化）
encoded_new_user_features = encoder.transform(new_user_data[['category', 'calories', 'ingredients_group', 'cooktimes_group']])
numerical_new_user_features = new_user_data[['preference', 'timestep']].to_numpy()
new_user_features = np.hstack((encoded_new_user_features, numerical_new_user_features))

# 计算新用户的平均特征
new_user_features_mean = np.mean(new_user_features, axis=0).reshape(1, -1)

# 标准化新用户的特征
scaled_new_user_features = scaler.transform(new_user_features_mean)

# 使用K-Means模型进行预测
new_user_cluster = kmeans.predict(scaled_new_user_features)[0]

# 输出新用户的群组
print(f"新用户被归类到群组: {new_user_cluster}")

# 载入原始数据，考虑新的数据格式
original_data = pd.read_csv('t_kmeans_sql.csv')

# 映射 'ingredients' 和 'cooktimes'
original_data['ingredients_group'] = original_data['ingredients'].apply(map_ingredients_to_group)
original_data['cooktimes_group'] = original_data['cooktimes'].apply(map_cooktimes_to_group)

# 使用新的特征集进行编码和标准化
encoded_original_features = encoder.transform(original_data[['category', 'calories', 'ingredients_group', 'cooktimes_group']])
numerical_original_features = original_data[['preference', 'timestep']].to_numpy()
original_features = np.hstack((encoded_original_features, numerical_original_features))

# 标准化原始特征
scaled_original_features = scaler.transform(original_features)

# 预测原始数据的群组标签
original_clusters = kmeans.predict(scaled_original_features)

# 创建包含用户ID和群组的数据框
user_features = original_data.copy()
user_features['cluster'] = original_clusters

# 筛选与新用户相同群组的其他用户ID
group_user_ids = user_features[user_features['cluster'] == new_user_cluster]['user_id'].unique()

# 提取这些用户的饮食偏好记录
group_preferences = original_data.loc[original_data['user_id'].isin(group_user_ids), ['category', 'calories', 'ingredients', 'preference', 'cooktimes']]

# 分析食物類別偏好
category_preferences = group_preferences.groupby('category')['preference'].mean().sort_values(ascending=False)
print("\n新用戶所在群組對食物類別的偏好:")
print(category_preferences)

# 分析卡路里偏好
calories_preferences = group_preferences.groupby('calories')['preference'].mean().sort_values(ascending=False)
print("\n新用戶所在群組對卡路里的偏好:")
print(calories_preferences)

# 分析食材數量偏好
ingredients_preferences = group_preferences.groupby('ingredients')['preference'].mean().sort_values(ascending=False)
print("\n新用戶所在群組對食材數量的偏好:")
print(ingredients_preferences)

# 设置显示选项
pd.set_option('display.expand_frame_repr', False)

# 輸出最感興趣的組合
combo_preferences = group_preferences.groupby(['category', 'calories', 'ingredients', 'cooktimes']).mean().reset_index().sort_values('preference', ascending=False)
combo_preferences = combo_preferences[['category', 'calories', 'ingredients', 'cooktimes']].head(5)

# 重置索引使其从1开始，注意reset_index(drop=False)会保留原来的索引作为一列，但我们这里不需要这样
combo_preferences.reset_index(drop=True, inplace=True)
combo_preferences.index += 1  # 现在索引从1开始

print("\n新用户对以下组合最感兴趣:")
print(combo_preferences.to_string(header=True))

