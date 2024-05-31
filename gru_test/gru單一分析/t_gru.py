# t_gru.py

import pandas as pd
import numpy as np
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, GRU, Dense
from tensorflow.keras.utils import to_categorical

# 1. 數據預處理
# 讀取數據
df = pd.read_csv('t_gru_sql.csv')  # 確保路徑正確

# 對category進行整數編碼
category_encoder = LabelEncoder()
df['category_encoded'] = category_encoder.fit_transform(df['category'])

# 對calories進行整數編碼
calories_encoder = LabelEncoder()
df['calories_encoded'] = calories_encoder.fit_transform(df['calories'])

# 'ingredients' 特征已是数值型，可能需要归一化或标准化，这里假设直接使用

# 準備輸入X和標籤y
X = df[['category_encoded', 'calories_encoded', 'ingredients']].values
y = to_categorical(df['preference'].values - 1, num_classes=5)  # 确保指定num_classes=5

# 拆分數據集
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 2. 模型定義、編譯和訓練
# 计算vocab_size，这里因为加入了数值型特征，所以不需要计算vocab_size
input_length = X.shape[1]  # 输入特征的数量现在是3

# 建立模型
model = Sequential([
    Dense(64, activation='relu', input_shape=(X_train.shape[1],)),  # 使用全连接层处理输入特征
    Dense(32, activation='relu'),
    Dense(5, activation='softmax')  # 输出层
])

# 編譯模型使用多類別交叉熵
model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])

# 訓練模型
model.fit(X_train, y_train, epochs=10, batch_size=32)

# 3. 評估和預測
loss, accuracy = model.evaluate(X_test, y_test)  # 評估模型
print(f"Test Loss: {loss}")  # 輸出測試損失
print(f"Test Accuracy: {accuracy}")  # 輸出測試準確率

# 4. top5推荐
# 定义想要的推荐数量
top_n = 5

# 模型预测
predictions = model.predict(X_test)

# 获取每个预测的最大概率类别索引
predicted_class_indices = np.argmax(predictions, axis=1)

# 获取这些类别的概率
predicted_class_probabilities = np.max(predictions, axis=1)

# 创建包含测试集索引、预测类别和对应概率的数组
combined = list(zip(range(len(X_test)), predicted_class_indices, predicted_class_probabilities, X_test))

# 按概率降序排列
sorted_by_probability = sorted(combined, key=lambda x: x[2], reverse=True)

# 初始化一个空列表来存储唯一组合的索引
unique_combinations_indices = []
unique_combinations = []

# 遍历排序后的索引来找出唯一组合
for idx, class_index, probability, features in sorted_by_probability:
    combination = (features[0], features[1], class_index)  # 将特征组合转换为元组以便于比较
    if combination not in unique_combinations:
        unique_combinations.append(combination)
        unique_combinations_indices.append(idx)
        if len(unique_combinations) == top_n:
            break  # 当达到所需的推荐数量时停止

# 将编码的特征和类别转换回原始值
top_combinations_decoded = [
    (
        category_encoder.inverse_transform([int(X_test[idx][0])])[0], 
        calories_encoder.inverse_transform([int(X_test[idx][1])])[0],
        X_test[idx][2],
        class_index + 1  # 加回1，因为之前预处理时减去了1
    ) 
    for idx in unique_combinations_indices
]

print("推荐给您的Top5组合有：", top_combinations_decoded)


import matplotlib.pyplot as plt

# 假设history是通过model.fit()返回的历史记录对象
history = model.fit(X_train, y_train, epochs=10, batch_size=32, validation_split=0.2)

# 准确率曲线
plt.plot(history.history['accuracy'], label='Train Accuracy')
plt.plot(history.history['val_accuracy'], label='Validation Accuracy')
plt.title('Model Accuracy')
plt.ylabel('Accuracy')
plt.xlabel('Epoch')
plt.legend(loc='upper left')
plt.show()

# 损失曲线
plt.plot(history.history['loss'], label='Train Loss')
plt.plot(history.history['val_loss'], label='Validation Loss')
plt.title('Model Loss')
plt.ylabel('Loss')
plt.xlabel('Epoch')
plt.legend(loc='upper left')
plt.show()


from sklearn.metrics import confusion_matrix
import seaborn as sns

# 假设您已经有了测试集的预测结果
predictions = model.predict(X_test)
predicted_classes = np.argmax(predictions, axis=1)
true_classes = np.argmax(y_test, axis=1)
cm = confusion_matrix(true_classes, predicted_classes)

# 绘制混淆矩阵
plt.figure(figsize=(10, 7))
sns.heatmap(cm, annot=True, fmt='d')
plt.xlabel('Predicted')
plt.ylabel('True')
plt.show()
