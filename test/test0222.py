from collections import Counter

# 小明上一星期晚餐吃的主菜
dinner_main_courses = ['豬', '豬', '牛', '豬', '豬', '雞', '豬']
dinner_staple_food =['飯', '麵', '飯', '麵', '飯', '麵', '飯']

2
100

# 使用Counter来计算每种主菜出现的次数
course_counts = Counter(dinner_main_courses)
staple_counts = Counter(dinner_staple_food)

# 计算总餐数
total_meals = len(dinner_main_courses)
total_staple = len(dinner_staple_food)

# 计算每种主菜的偏好概率
course_probabilities = {course: count / total_meals for course, count in course_counts.items()}
staple_probabilities = {staple: count / total_staple for staple, count in staple_counts.items()}


# 打印每种主菜的偏好概率
for course, probability in course_probabilities.items():
    print(f"小明對{course}的想法為 {probability:.2%}")
for staple, probability in staple_probabilities.items():
    print(f"小明對{staple}的想法為 {probability:.2%}")


# 找出最喜欢的主菜
favorite_course = max(course_probabilities, key=course_probabilities.get)
favorite_staple = max(staple_probabilities, key=staple_probabilities.get)

# 打印最喜欢的主菜
print(f"小明今天最想吃的是{favorite_course}肉{favorite_staple}")
