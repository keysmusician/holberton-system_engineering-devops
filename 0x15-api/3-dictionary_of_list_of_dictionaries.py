#!/usr/bin/python3
"""Creates a JSON dump from fake user data using the JSON Placeholder API."""
import json
import requests


if __name__ == "__main__":
    api = 'https://jsonplaceholder.typicode.com/'

    users = requests.get(api + 'users').json()

    data = dict()

    for user in users:
        user_id = user.get("id")
        tasks = requests.get(api + 'todos?userId={}'.format(user_id))\
                        .json()

        task_list = [{
                        "username": user.get("username"),
                        "completed": task.get("completed"),
                        "task": task.get("title")
                    } for task in tasks]

        data[user_id] = task_list

    filename = "todo_all_employees.json"
    with open(filename, "w") as file:
            json.dump(data, file)
