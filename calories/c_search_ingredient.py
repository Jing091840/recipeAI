# c_search_ingredient.py
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",  
    user="calorie",  
    password="",  
    database="cal" 
)

min_cal = input("請輸入最小卡路里: ")
max_cal = input("請輸入最大卡路里: ")

cursor = conn.cursor()
query= "SELECT * FROM cal_info WHERE c_calorie BETWEEN %s AND %s ORDER BY c_calorie ASC"
cursor.execute(query, (min_cal, max_cal))

rows = cursor.fetchall()
if rows:
    print("以下為熱量範圍內的食材：")
    for row in rows:
        print("熱量:",row[4],"大卡，食材:",row[1])
else:
    print("目前沒有匹配的食材>_<")



cursor.close()
conn.close()
