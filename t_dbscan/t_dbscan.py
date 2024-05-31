import pandas as pd
from sklearn.preprocessing import OneHotEncoder
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import DBSCAN
import numpy as np
import joblib

# 1. 读取数据
data = pd.read_csv('t_dbscan_sql.csv')

# 2. 将食材分组映射到新的分组
def map_ingredients_to_group(ingredients):
    if ingredients == 'small':
        return 1
    elif ingredients == 'medium':
        return 2
    elif ingredients == 'large':
        return 3
    else:
        return 4

data['ingredients_group'] = data['ingredients'].apply(map_ingredients_to_group)

# 3. 编码和特征处理
encoder = OneHotEncoder(sparse=False) 
encoded_features = encoder.fit_transform(data[['category', 'calories', 'ingredients_group']])

numerical_features = data[['preference']].to_numpy()
features = np.hstack((encoded_features, numerical_features))

# 4. 聚类模型
scaler = StandardScaler()
scaled_features = scaler.fit_transform(features)

# 使用 DBSCAN 模型
dbscan = DBSCAN(eps=1.12, min_samples=100)  # 可根据数据集的特点调整 eps 和 min_samples 参数
dbscan.fit(scaled_features)

clusters = dbscan.labels_

# 5. 效能评估

# 密度的评估指标：
# 计算核心对象数量
core_samples_mask = np.zeros_like(clusters, dtype=bool)
core_samples_mask[dbscan.core_sample_indices_] = True
core_samples_count = np.sum(core_samples_mask)

print(f"核心对象数量: {core_samples_count}")

# 计算噪声点数量
noise_count = np.sum(clusters == -1)  # DBSCAN 将噪声点标记为 -1
print(f"噪声点数量: {noise_count}")

# 计算簇的数量（不包括噪声点）
unique_clusters = np.unique(clusters[clusters != -1])  # 去除噪声点
cluster_count = len(unique_clusters)
print(f"簇的数量: {cluster_count}")

# 计算每个簇的密度
density_per_cluster = []
for cluster_label in unique_clusters:
    cluster_density = np.sum(clusters == cluster_label) / core_samples_count  # 簇内核心对象数量 / 核心对象总数
    density_per_cluster.append(cluster_density)
    print(f"簇 {cluster_label} 的密度: {cluster_density:.4f}")

# 可视化分析：
import matplotlib.pyplot as plt
plt.scatter(scaled_features[:, 0], scaled_features[:, 1], c=clusters, cmap='viridis')
plt.xlabel('Feature 1')
plt.ylabel('Feature 2')
plt.title('DBSCAN Clustering Result')
plt.colorbar(label='Cluster')
plt.show()

from sklearn.metrics import silhouette_score
# 假设 `clusters` 是DBSCAN之后得到的簇标签，`scaled_features` 是特征数据
silhouette_avg = silhouette_score(scaled_features, clusters)
print(f'平均轮廓系数: {silhouette_avg}')

from sklearn.metrics import calinski_harabasz_score
# 同样假设 `clusters` 是簇标签，`scaled_features` 是特征数据
calinski_harabasz_avg = calinski_harabasz_score(scaled_features, clusters)
print(f'Calinski-Harabasz指数: {calinski_harabasz_avg}')

from sklearn.metrics import davies_bouldin_score
# 再次假设 `clusters` 是簇标签，`scaled_features` 是特征数据
davies_bouldin_avg = davies_bouldin_score(scaled_features, clusters)
print(f'Davies-Bouldin指数: {davies_bouldin_avg}')



# 6. 保存模型
joblib.dump(dbscan, 'd_model.pkl')
joblib.dump(encoder, 'd_encoder.pkl')
joblib.dump(scaler, 'd_scaler.pkl')
