# user_input.py

def get_user_input():
    season = input("請輸入季節（1.春季、2.夏季、3.秋季、4.冬季）：")
    meat = input("請選擇肉類（1.牛肉、2.豬肉、3.雞肉、4.海鮮、5.素食）：")
    cuisine = input("請選擇菜式風格（1.季節限定、2.中式、3.法式、4.日式、5.韓式）：")
    return season, meat, cuisine
