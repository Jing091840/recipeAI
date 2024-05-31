# main.py

import random
import time
from recipes import recipes
from recipes_ing import recipes_ing
from recipes_step import recipes_step
from recipes_nut import recipes_nut
from user_input import get_user_input


def get_recipe(season, meat, cuisine):
    return recipes.get(season, {}).get(meat, {}).get(cuisine, [])

def main():
    season, meat, cuisine = get_user_input()
    selected_recipes = get_recipe(season, meat, cuisine)

    if selected_recipes:
        selected_recipe = random.choice(selected_recipes)
        print("推薦食譜：", selected_recipe)
        time.sleep(1)
        print("料理準備食材：", recipes_ing.get(selected_recipe, "暫無詳情"))
        time.sleep(1)
        print("步驟：", recipes_step.get(selected_recipe, "暫無詳情"))
        time.sleep(1)
        print("估算熱量：", recipes_nut.get(selected_recipe, "未知"), "卡路里")
    else:
        print("沒有找到匹配的食譜。")

if __name__ == "__main__":
    main()
