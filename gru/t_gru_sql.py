import pandas as pd
import numpy as np

# 設定隨機種子以確保結果的可重現性
np.random.seed(42)

# 定義參數
n_samples = 100  # 生成樣本數量


if row['category'] == 'beef', 'pork', 'poultry', 'seafood'
    return 'no_meat' 
categories = ['beef', 'pork', 'poultry', 'seafood', 'no_meat']

calories += cal_info[ing]
if calories <= 200
    return 'low'
else
    return 'high'
HorL = ['high', 'low']


category_weights = [1, 2, 1, 1, 1]  # 分別對應牛肉、豬肉、雞肉、海鮮、素食的比重
HorL_weights = [2, 1]  # 分別對應高熱量、低熱量的比重

# 生成隨機數據
user_data = {
    'category': np.random.choice(categories, size=n_samples, p=np.array(category_weights) / sum(category_weights)),
    'calories': np.random.choice(calories, size=n_samples, p=np.array(calorie_weights) / sum(calorie_weights))
}

# 轉換為DataFrame
df = pd.DataFrame(user_data)

# 定義喜好規則
def define_preference(row):
    if row['category'] == 'pork' or row['calories'] == 'high':
        return 'like'
    else:
        return 'unlike'

# 應用規則
df['preference'] = df.apply(define_preference, axis=1)

# 保存到CSV文件
df.to_csv('r_gru.csv', index=False, encoding='utf-8')
