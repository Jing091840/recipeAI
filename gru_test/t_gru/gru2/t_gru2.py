# t_gru2.py
# set CUDA_VISIBLE_DEVICES=0

import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import GRU, Dense, Dropout, BatchNormalization
from tensorflow.keras.optimizers import Adam
from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score
import joblib

# 加载数据
df = pd.read_csv('t_gru2_sql.csv')

# 数据预处理
# 独热编码
encoder = OneHotEncoder(sparse=False)
encoded_features = encoder.fit_transform(df[['category', 'calories', 'ingredients', 'cooktimes']])

# 分离特征和标签
X = encoded_features
y = df['preference'].values

# 分割数据集
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 構建模型
model = Sequential([
    Dense(512, activation='relu', input_shape=(X_train.shape[1],)),
    BatchNormalization(),
    Dropout(0.3),  # Dropout層减少過擬合
    Dense(256, activation='relu'),  # 隱藏層
    BatchNormalization(),
    Dropout(0.3),
    Dense(128, activation='relu'),
    BatchNormalization(),
    Dropout(0.3),
    Dense(1, activation='linear')
])

model.compile(optimizer=Adam(learning_rate=0.0005),  # 调整学习率
              loss='mean_squared_error')
# 模型训练
# 调整批量大小和训练轮数
model.fit(X_train, y_train, batch_size=32, epochs=20, validation_split=0.2)  

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
print(f'R² Score: {r2:.5f}')


# 保存模型
model.save('model_gru2.keras')  # 使用 HDF5 文件保存模型

# 保存OneHotEncoder
joblib.dump(encoder, 'encoder_gru2.joblib')
