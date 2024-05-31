import pandas as pd
import numpy as np
import joblib
from tensorflow.keras.models import load_model

# 加载OneHotEncoder和GRU模型
encoder = joblib.load('encoder_gru2.joblib')
model_gru = load_model('model_gru2.keras')

# 加载新用户数据
new_user_data = pd.read_csv('t_gru2_user_sql.csv')

# 独热编码预处理新用户数据
encoded_new_user_features = encoder.transform(new_user_data[['category', 'calories', 'ingredients', 'cooktimes']])

# 加载或定义项目库 - 这需要是你希望进行推荐的所有项目的DataFrame
project_library = pd.read_csv('t_gru2_sql.csv')  # 假设这是你的项目库文件

# 独热编码预处理项目库数据
project_library_encoded = encoder.transform(project_library[['category', 'calories', 'ingredients', 'cooktimes']])

# 使用GRU模型对整个项目库进行预测
project_interests = model_gru.predict(project_library_encoded)

# 将预测兴趣度得分附加到项目库上
project_library['predicted_interest'] = project_interests[:, 0]

# 筛选和排序得到TOP N推荐（这里先不限制数量，确保有足够的项目可以选择）
recommendations = project_library.sort_values('predicted_interest', ascending=False)

# 去重，保留predicted_interest最高的条目
unique_recommendations = recommendations.drop_duplicates(subset=['category', 'calories', 'ingredients', 'cooktimes'])

# 从去重后的推荐中选取TOP 5
top_5_unique_recommendations = unique_recommendations.head(5).reset_index(drop=True)

# 修改索引，使其从1开始
top_5_unique_recommendations.index += 1

print("\n新用戶對以下組合最感興趣:")
print(top_5_unique_recommendations[['category', 'calories', 'ingredients', 'cooktimes']])
