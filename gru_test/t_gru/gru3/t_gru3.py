from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import GRU, Dense, BatchNormalization
from tensorflow.keras.optimizers import Adam
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder
import numpy as np
import pandas as pd
from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score
import joblib

# 假设 df 是包含所有数据的DataFrame
df = pd.read_csv('t_gru3_sql.csv')  # 用实际文件路径替换
df.sort_values(by=['user_id', 'timestep'], inplace=True)


# 将分类特征转换为独热编码
encoder = OneHotEncoder(sparse=False)
categorical_features = ['category', 'calories', 'ingredients', 'cooktimes']
encoded_features = encoder.fit_transform(df[categorical_features])

# 假设 encoded_features 是独热编码后的特征矩阵，df 是原始DataFrame
time_steps = df['timestep'].max()
features = encoded_features.shape[1]  # 从独热编码得到特征数
num_samples = df['user_id'].nunique()  # 总样本数

# 初始化X和y数组
num_samples = df['user_id'].nunique() 
X = np.zeros((num_samples, time_steps, features))
y = np.zeros((num_samples, 1))

# 填充X和y
for idx, (user_id, group) in enumerate(df.groupby('user_id')):
    if len(group) == time_steps:
        # 这里假设group是按timestep排序的，如果不是，请先进行排序
        X[idx, :, :] = encoded_features[group.index, :]
        y[idx] = group['preference'].iloc[-1]  # 假设我们想预测最后一个时间步的preference
print(X.shape, y.shape)
# 分割数据集
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)


# 構建GRU模型
model = Sequential([
    GRU(128, input_shape=(time_steps, features), return_sequences=True),
    Dense(128, activation='relu'),
    BatchNormalization(),
    GRU(64, return_sequences=False),
    Dense(64, activation='relu'),
    BatchNormalization(),
    Dense(1)
])

model.compile(optimizer=Adam(learning_rate=0.0001), loss='mean_squared_error')

# 训练模型
model.fit(X_train, y_train, batch_size=64, epochs=20, validation_split=0.2)

# 模型评估
test_loss = model.evaluate(X_test, y_test)
print(f'Test Loss: {test_loss:.3f}')

# 使用模型进行预测
y_pred = model.predict(X_test)

# 计算MSE
mse = mean_squared_error(y_test, y_pred)
print(f'Mean Squared Error (MSE): {mse:.3f}')

# 计算RMSE
rmse = np.sqrt(mse)
print(f'Root Mean Squared Error (RMSE): {rmse:.3f}')

# 计算MAE
mae = mean_absolute_error(y_test, y_pred)
print(f'Mean Absolute Error (MAE): {mae:.3f}')

# 计算R²
r2 = r2_score(y_test, y_pred)
print(f'R² Score: {r2:.3f}')


# 保存模型
model.save('model_gru3.keras')  # 使用 HDF5 文件保存模型

# 保存OneHotEncoder
joblib.dump(encoder, 'encoder_gru3.joblib')