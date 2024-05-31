import pandas as pd
from sklearn.preprocessing import OneHotEncoder, StandardScaler
from sklearn.cluster import KMeans
import numpy as np
import joblib

# 1. 读取数据
data = pd.read_csv('t_kmeans_sql.csv')

# 2. 将食材和烹饪时间分類映射到新的分组
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

data['ingredients_group'] = data['ingredients'].apply(map_ingredients_to_group)
data['cooktimes_group'] = data['cooktimes'].apply(map_cooktimes_to_group)

# 3. 编码和特征处理
encoder = OneHotEncoder(sparse=False) 
encoded_features = encoder.fit_transform(data[['category', 'calories', 'ingredients_group', 'cooktimes_group']])

numerical_features = data[['preference', 'timestep']].to_numpy()
features = np.hstack((encoded_features, numerical_features))

features_df = pd.DataFrame(features)
features_df['user_id'] = data['user_id']

user_features = features_df.groupby('user_id').mean()

# 4. 标准化特征
# 由于 'user_id' 是索引，所以我们不需要从 DataFrame 中删除它
scaler = StandardScaler()

# 如果 'cluster' 列已存在，则只选择尚未进行聚类分析的特征列
if 'cluster' in user_features.columns:
    features_to_scale = user_features.drop(columns='cluster')
else:
    features_to_scale = user_features

scaled_features = scaler.fit_transform(features_to_scale)

# 5. K-Means 聚類
kmeans = KMeans(n_clusters=8, random_state=42, n_init=10)
kmeans.fit(scaled_features)

clusters = kmeans.labels_
user_features['cluster'] = clusters

print(user_features['cluster'].value_counts())

# 6. 效能评估
from sklearn.metrics import silhouette_score, calinski_harabasz_score, davies_bouldin_score

silhouette_avg = silhouette_score(scaled_features, kmeans.labels_)
print(f"轮廓系数: {silhouette_avg:.2f}")

calinski_harabasz = calinski_harabasz_score(scaled_features, kmeans.labels_)
print(f"Calinski-Harabasz 指数: {calinski_harabasz:.2f}")

davies_bouldin = davies_bouldin_score(scaled_features, kmeans.labels_)
print(f"戴维森-邦德指数: {davies_bouldin:.2f}")

# 7. 保存模型
joblib.dump(kmeans, 'k_model.pkl')
joblib.dump(encoder, 'k_encoder.pkl')
joblib.dump(scaler, 'k_scaler.pkl')
