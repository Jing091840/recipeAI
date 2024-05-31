import pandas as pd
import numpy as np
import joblib
from tensorflow.keras.models import load_model

# 加载模型和OneHotEncoder
encoder = joblib.load('encoder_gru3.joblib')
model = load_model('model_gru3.keras')

# 加载新用户数据
new_user_data = pd.read_csv('t_gru3_user_sql.csv')

# 确保这里的特征列和训练模型时使用的特征列一致
categorical_features = ['category', 'calories', 'ingredients', 'cooktimes']

# 假设old_user_data是旧用户数据集
old_user_data = pd.read_csv('t_gru3_sql.csv')

# 对旧用户的数据应用相同的预处理步骤（独热编码）
encoded_features_old_user = encoder.transform(old_user_data[categorical_features])
# 假定 encoded_features_old_user 是二维数组，形状为 (n_samples, n_features)

# 重塑数组以添加时间步维度，形状变为 (n_samples, 1, n_features)
encoded_features_old_user_reshaped = np.expand_dims(encoded_features_old_user, axis=1)

# 现在使用模型进行预测，使用重塑后的数据
project_interests = model.predict(encoded_features_old_user_reshaped)

# 之后的步骤与之前相同
old_user_data['predicted_interest'] = project_interests[:, 0]
top_5_recommendations = old_user_data.sort_values(by='predicted_interest', ascending=False).drop_duplicates(subset=['category', 'calories', 'ingredients', 'cooktimes']).head(5).reset_index(drop=True)

# 修改索引，使其从1开始
top_5_recommendations.index += 1
print("\n新用戶對以下組合最感興趣:")
print(top_5_recommendations[['category', 'calories', 'ingredients', 'cooktimes']])
